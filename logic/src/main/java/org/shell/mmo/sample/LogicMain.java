package org.shell.mmo.sample;

import com.google.protobuf.MessageLite;
import com.google.protobuf.Parser;
import com.shell.mmo.utils.net.Adaptor;
import com.shell.mmo.utils.net.Decoder;
import com.shell.mmo.utils.net.Encoder;
import com.shell.mmo.utils.net.Server;
import com.shell.mmo.utils.net.message.MessageHandler;
import io.netty.channel.Channel;
import org.shell.mmo.sample.message.ClientHandlerGroup;
import org.shell.mmo.sample.message.ClientMessageGroup;

import java.util.Map;

/**
 * Created by zhangxiangxi on 16/7/21.
 */
public class LogicMain {
    public static void main(String[] args) throws InterruptedException {
        Server logicServer = Server.create(5555
                , new Decoder(ClientMessageGroup.id2parser())
                , new Encoder(ClientMessageGroup.parser2id())
                , new Adaptor("logic", new Adaptor.MessageHandlerFactory() {
                    Map<Parser<? extends MessageLite>, Class<? extends MessageHandler>> map = ClientHandlerGroup.create();
                    @Override
                    public MessageHandler create(Parser<? extends MessageLite> parser) {
                        org.shell.mmo.sample.message.MessageHandler handler = null;
                        try {
                            handler = (org.shell.mmo.sample.message.MessageHandler) map.get(parser).newInstance();
                        } catch (InstantiationException e) {
                            e.printStackTrace();
                            return null;
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                            return null;
                        }
                        // TODO handler
                        return handler;
                    }
                }, new Adaptor.ChannelEventHandler() {
                    @Override
                    public void handler(Channel channel) throws Exception {
                        // TODO active
                    }
                }, new Adaptor.ChannelEventHandler() {
                    @Override
                    public void handler(Channel channel) throws Exception {
                        // TODO inactive
                    }
                })
                , null);
        logicServer.startup();
    }
}
