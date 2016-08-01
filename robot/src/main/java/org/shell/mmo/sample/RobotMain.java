package org.shell.mmo.sample;

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Stage;
import com.google.protobuf.MessageLite;
import com.google.protobuf.Parser;
import com.shell.mmo.utils.TimeUtil;
import com.shell.mmo.utils.net.*;
import com.shell.mmo.utils.net.message.MessageHandler;
import io.netty.channel.Channel;
import org.shell.mmo.sample.account.Account;
import org.shell.mmo.sample.message.ChannelAttributeKey;
import org.shell.mmo.sample.message.LogicHandlerGroup;
import org.shell.mmo.sample.message.LogicMessageGroup;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;

import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by zhangxiangxi on 16/7/21.
 */
public class RobotMain {
    private static final AtomicInteger index = new AtomicInteger(2);
    public static void main(String[] args) throws Exception {
        Injector injector = Guice.createInjector(Stage.DEVELOPMENT);

        Client client = Client.create(Runtime.getRuntime().availableProcessors() * 2
                , new Decoder(LogicMessageGroup.id2parser())
                , new Encoder(LogicMessageGroup.parser2id())
                , new Adaptor("logic", new Adaptor.MessageHandlerFactory() {
                    Map<Parser<? extends MessageLite>, Class<? extends MessageHandler>> map = LogicHandlerGroup.create();
                    @Override
                    public MessageHandler create(Parser<? extends MessageLite> parser) {
                        return injector.getInstance(map.get(parser));
                    }
                }, new Adaptor.ChannelEventHandler() {
                    @Override
                    public void handler(Channel channel) throws Exception {
                        Account account = createAccount(channel);
                        channel.attr(ChannelAttributeKey.ACCOUNT.getKey()).set(account);
                        NetUtil.write(channel, LogicClient.ReqLoginLogin.newBuilder()
                                .setUsr(account.getUsr())
                                .setPlatform(account.getPlatform())
                                .setServer(account.getServer())
                                .setAdult(account.isAdult())
                                .setTime(account.getLoginTime())
                                .setSign(sign(account)));
                    }
                }, new Adaptor.ChannelEventHandler() {
                    @Override
                    public void handler(Channel channel) throws Exception {
                        // TODO inactive
                    }
                }));
        client.connect("localhost", 5555);
    }

    private static String sign(Account account) {
        return "";
    }

    private static Account createAccount(Channel channel) {
        Account account = new Account(channel);
        account.setUsr("robot-" + index.incrementAndGet());
        account.setPlatform(Global.Platform.INNER);
        account.setServer((short) 1);
        account.setAdult((index.get() & 0x1) == 0);
        account.setLoginTime(TimeUtil.seconds());
        return account;
    }
}
