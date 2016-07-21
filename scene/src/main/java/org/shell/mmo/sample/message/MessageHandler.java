package org.shell.mmo.sample.message;

import com.google.protobuf.MessageLite;
import io.netty.channel.Channel;
import org.shell.mmo.sample.message.proto.Global;

import java.util.concurrent.Executor;

/**
 * Created by zhangxiangxi on 16/7/20.
 */
public abstract class MessageHandler<K extends MessageLite> extends com.shell.mmo.utils.net.message.MessageHandler<Global.Error, Global.Module, K> {
    protected Channel channel;

    protected abstract void execute(K message);

    public abstract Global.Module module();

    @Override
    protected boolean init(Channel channel) {
        this.channel = channel;
        return true;
    }

    @Override
    public Executor worker() {
        return null;
    }
}
