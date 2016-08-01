package org.shell.mmo.sample.account;

import com.google.common.cache.CacheLoader;
import com.google.inject.Singleton;
import com.google.protobuf.MessageLiteOrBuilder;
import com.shell.mmo.utils.HashUtil;
import com.shell.mmo.utils.net.NetUtil;
import com.shell.mmo.utils.thread.DisruptorWorker;
import com.shell.mmo.utils.thread.Worker;
import io.netty.channel.Channel;

import java.util.List;
import java.util.Timer;

/**
 * Created by zhangxiangxi on 16/7/28.
 */
@Singleton
public class AccountService extends com.shell.mmo.modules.account.AccountService<Account> {
    private final Worker[] workers;
    public AccountService(List<Runnable> shutdownTask) throws Exception {
        super(new Loader(), new Timer("account-timer"), new Saver(), shutdownTask);
        workers = DisruptorWorker.createGroup("account-worker", 16 * 1024, Thread.MAX_PRIORITY, Runtime.getRuntime().availableProcessors());
    }

    public boolean write(Account account, MessageLiteOrBuilder msg) {
        if (account == null) {
            logger.warn("丢弃消息[账号不存在]:{}", msg.getClass().getSimpleName());
            return false;
        }
        Channel channel = account.getChannel();
        if (channel == null) {
            logger.warn("丢弃消息[账号({})的channel不存在]:{}", account.getId(), msg.getClass().getSimpleName());
            return false;
        }
        NetUtil.write(channel, msg);
        return true;
    }

    public boolean write(long id, MessageLiteOrBuilder msg) {
        Account account = get(id);
        if (account == null) {
            logger.warn("丢弃消息[账号({})不存在]:{}", id, msg.getClass().getSimpleName());
            return false;
        }
        return write(account, msg);
    }

    public Worker worker(String usr) {
        return HashUtil.object(workers, usr.hashCode());
    }

    public void write(MessageLiteOrBuilder msg) {
        for (Account account : getAccounts().values()) {
            write(account, msg);
        }
    }

    public static class Loader extends CacheLoader<Key, Account> {
        @Override
        public Account load(Key key) throws Exception {
            // TODO 数据库获取
            return null;
        }
    }

    public static class Saver implements com.shell.mmo.modules.account.AccountService.Saver<Account> {

        @Override
        public void saveSync(Account account) {
            // TODO
        }

        @Override
        public void saveAsync(Account account) {
            // TODO
        }
    }
}
