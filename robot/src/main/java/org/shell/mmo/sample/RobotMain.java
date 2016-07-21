package org.shell.mmo.sample;

import com.google.protobuf.MessageLite;
import com.google.protobuf.Parser;
import com.shell.mmo.utils.TimeUtil;
import com.shell.mmo.utils.net.*;
import com.shell.mmo.utils.net.message.MessageHandler;
import io.netty.channel.Channel;
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
    private static final AtomicInteger index = new AtomicInteger();
    public static void main(String[] args) throws Exception {
        Client client = Client.create(Runtime.getRuntime().availableProcessors() * 2
                , new Decoder(LogicMessageGroup.id2parser())
                , new Encoder(LogicMessageGroup.parser2id())
                , new Adaptor("logic", new Adaptor.MessageHandlerFactory() {
                    Map<Parser<? extends MessageLite>, Class<? extends MessageHandler>> map = LogicHandlerGroup.create();
                    @Override
                    public MessageHandler create(Parser<? extends MessageLite> parser) {
                        org.shell.mmo.sample.message.MessageHandler handler;
                        try {
                            handler = (org.shell.mmo.sample.message.MessageHandler) map.get(parser).newInstance();
                        } catch (InstantiationException e) {
                            e.printStackTrace();
                            return null;
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                            return null;
                        }
                        return handler;
                    }
                }, new Adaptor.ChannelEventHandler() {
                    @Override
                    public void handler(Channel channel) throws Exception {
                        LogicClient.ReqLoginLogin.Builder msg = LogicClient.ReqLoginLogin.newBuilder()
                                .setUsr("robot" + index.incrementAndGet())
                                .setPlatform(Global.Platform.P37WAN)
                                .setServer(9999)
                                .setAdult(false)
                                .setTime(TimeUtil.seconds())
                                .setSign("xxxxcdfdafdddddddddd");
                        NetUtil.write(channel, msg);
                    }
                }, new Adaptor.ChannelEventHandler() {
                    @Override
                    public void handler(Channel channel) throws Exception {
                        // TODO inactive
                    }
                }));
        client.connect("localhost", 5555);
    }
}
