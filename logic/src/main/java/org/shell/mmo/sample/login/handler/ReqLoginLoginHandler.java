package org.shell.mmo.sample.login.handler;

import com.google.common.cache.CacheLoader;
import com.google.inject.Inject;
import com.shell.mmo.modules.uid.UIDService;
import com.shell.mmo.utils.StringUtil;
import com.shell.mmo.utils.TimeUtil;
import com.shell.mmo.utils.net.NetUtil;
import com.shell.mmo.utils.thread.Worker;
import io.netty.channel.Channel;
import org.shell.mmo.sample.account.Account;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.account.LoginEvent;
import org.shell.mmo.sample.account.RoleLoginEvent;
import org.shell.mmo.sample.event.EventBus;
import org.shell.mmo.sample.login.LoginMessageHandler;
import org.shell.mmo.sample.message.ChannelAttributeKey;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.uid.UID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.ExecutionException;

public class ReqLoginLoginHandler extends LoginMessageHandler<LogicClient.ReqLoginLogin> {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Inject
    AccountService accountService;
    @Inject
    UIDService uidService;
    @Inject
    EventBus eventBus;

    @Override
    protected Worker worker() {
        return message.hasUsr() ? accountService.worker(message.getUsr()) : null;
    }

    @Override
    protected void execute(LogicClient.ReqLoginLogin message) {
        synchronized (channel) {
            if (channel.attr(ChannelAttributeKey.ACCOUNT.getKey()).get() != null) {
                NetUtil.write(channel, error(Global.Error.LOGIN_REPEAT));
                return;
            }
        }

        Global.Error error = check(message);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }

        Account account = login(channel, message);
        if (account != null) { // 登录成功
            synchronized (channel) {
                channel.attr(ChannelAttributeKey.ACCOUNT.getKey()).set(account);
            }
            eventBus.post(new LoginEvent(account));
            if (account.getRole() != null) {
                eventBus.post(new RoleLoginEvent(account));
            }
        }
    }

    private Global.Error check(LogicClient.ReqLoginLogin message) {
        // 非法账号
        if (!message.hasUsr()
                || message.getUsr().isEmpty()
                || StringUtil.containsChinese(message.getUsr())
                || !StringUtil.legal(message.getUsr())) {
            return Global.Error.USR_ERR;
        }
        String host = NetUtil.host(channel);
        // TODO 禁止的账号
        // TODO 禁止的主机

        // 非法平台
        if (!message.hasPlatform()) {
            return Global.Error.PLATFORM_ERR;
        }
        // 内网开放
        if (host.startsWith("192.168") || host.equals("127.0.0.1")) {
            return null;
        }
        // 密钥过期
        if (!message.hasTime() || Math.abs(TimeUtil.seconds() - message.getTime()) > 1200) {
            return Global.Error.LOGIN_OVERTIME;
        }
        // TODO 非法密钥:密钥规则添加
        if (!message.hasSign()) {
            return Global.Error.LOGIN_FLAG_ERR;
        }
        return null;
    }

    private Account login(Channel channel, LogicClient.ReqLoginLogin message) {
        // 获取账号数据
        AccountService.Key key = new AccountService.Key((byte) message.getPlatform().getNumber(), (short) message.getServer(), message.getUsr());
        Account account = null;
        try {
            account = accountService.get(key);
        } catch (CacheLoader.InvalidCacheLoadException e) {
            // 获取不到账号数据
        } catch (ExecutionException e) {
            logger.error("获取账号失败", e);
            NetUtil.write(channel, error(Global.Error.SYS_ERR));
            return null;
        }
        if (account == null) {
            account = new Account();
            account.setId(uidService.uid(UID.ACCOUNT.getType(), key.getPlatform(), key.getServer()));
            account.setKey(key);
            accountService.add(account);
        }

        // 顶号处理
        if (account.getWorker() == null) {
            account.setWorker(worker());
        }
        Channel oldChannel = account.getChannel();
        if (oldChannel != null) {
            oldChannel.eventLoop().execute(() -> {
                NetUtil.write(oldChannel, LogicClient.ReqLoginReplace.newBuilder().setHost(NetUtil.host(channel)));
                NetUtil.close(oldChannel, "顶号");
            });
        }
        account.setChannel(channel);

        // 添加到集合
        accountService.add(account);

        // 通知前端
        LogicClient.ResLoginLogin.Builder builder = LogicClient.ResLoginLogin.newBuilder();
        builder.setId(account.getId());
        builder.setGold(account.getGold());
        if (account.getRole() != null) {
            builder.setLeaderRole(account.getRole().build());
        }
        NetUtil.write(channel, builder);

        return account;
    }


    @Override
    public Module module() {
        return Module.LOGIN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResLoginLogin.newBuilder().setError(e).build();
    }
}
