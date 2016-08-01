package org.shell.mmo.sample.login;

import com.google.protobuf.MessageLite;
import com.google.protobuf.MessageLiteOrBuilder;
import org.shell.mmo.sample.message.proto.Global;

/**
 * 需要自行实现
 */
public abstract class LoginMessageHandler<K extends MessageLite> extends com.shell.mmo.utils.net.message.MessageHandler<K> {
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