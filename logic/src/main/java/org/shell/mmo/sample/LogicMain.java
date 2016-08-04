package org.shell.mmo.sample;

import com.google.inject.Guice;
import com.google.inject.Inject;
import com.google.inject.Injector;
import com.google.inject.Stage;
import com.google.protobuf.MessageLite;
import com.google.protobuf.Parser;
import com.shell.mmo.utils.net.*;
import com.shell.mmo.utils.net.message.MessageHandler;
import io.netty.channel.Channel;
import org.shell.mmo.sample.account.Account;
import org.shell.mmo.sample.config.proto.Config;
import org.shell.mmo.sample.guice.PostConstructModule;
import org.shell.mmo.sample.message.ChannelAttributeKey;
import org.shell.mmo.sample.message.ClientHandlerGroup;
import org.shell.mmo.sample.message.ClientMessageGroup;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.RoomService;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/7/21.
 */
public class LogicMain {
    @Inject
    RoomService roomService;

    public void start() throws InterruptedException {
        Server logicServer = Server.create(5555
                , new Decoder(ClientMessageGroup.id2parser())
                , new Encoder(ClientMessageGroup.parser2id())
                , new Adaptor("logic", new Adaptor.MessageHandlerFactory() {
                    Map<Parser<? extends MessageLite>, Class<? extends MessageHandler>> map = ClientHandlerGroup.create();
                    @Override
                    public MessageHandler create(Parser<? extends MessageLite> parser) {
                        MessageHandler handler = injector.getInstance(map.get(parser));
                        return handler;
                    }
                }, new Adaptor.ChannelEventHandler() {
                    @Override
                    public void handler(Channel channel) throws Exception {
                        // TODO 测试阶段有效
                        Config.ContainerGroup instance = injector.getInstance(Config.ContainerGroup.class);
                        NetUtil.write(channel, LogicClient.ReqLoginConfig.newBuilder().setData(instance.toByteString()));
                    }
                }, new Adaptor.ChannelEventHandler() {
                    @Override
                    public void handler(Channel channel) throws Exception {
                        Account account;
                        synchronized (channel) {
                            Object o = channel.attr(ChannelAttributeKey.ACCOUNT.getKey()).getAndRemove();
                            if (o == null) {
                                return;
                            }
                            account = (Account) o;
                        }
                        account.getWorker().execute(new Runnable() {
                            @Override
                            public void run() {
                                // sync unbind
                                if (channel != account.getChannel()) {
                                    return;
                                }
                                account.setChannel(null);
                            }
                        });
                    }
                })
                , null);
        logicServer.startup();
    }

    private static Injector injector;
    public static void main(String[] args) throws InterruptedException {
        List<Runnable> shutdownTasks = new ArrayList<>();
        injector = Guice.createInjector(Stage.DEVELOPMENT
                , new PostConstructModule(shutdownTasks
                        , new File("/Users/zhangxiangxi/IdeaProjects/mmo-sample/share/config")));

        injector.getInstance(LogicMain.class).start();

        Runtime.getRuntime().addShutdownHook(new Thread() {
            @Override
            public void run() {
                for (Runnable task : shutdownTasks) {
                    try {
                        task.run();
                    } catch (Exception e) {
                        // TODO
                    }
                }
            }
        });
    }
}
