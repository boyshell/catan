package org.shell.mmo.sample.message;

import com.google.protobuf.MessageLite;
import com.google.protobuf.MessageLiteOrBuilder;
import org.shell.mmo.sample.message.proto.Global;

/**
 * Created by zhangxiangxi on 16/7/20.
 */
public abstract class MessageHandler<K extends MessageLite> extends com.shell.mmo.utils.net.message.MessageHandler<K> {
    public abstract Global.Module module();
    public abstract MessageLiteOrBuilder error(Global.Error error);

    @Override
    protected boolean filter() {
        return false;
    }

    @Override
    protected void rescue() {
    }
}