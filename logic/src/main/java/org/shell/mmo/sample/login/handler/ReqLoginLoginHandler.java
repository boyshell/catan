package org.shell.mmo.sample.login.handler;

import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqLoginLoginHandler extends org.shell.mmo.sample.message.MessageHandler<LogicClient.ReqLoginLogin> {
    @Override
    protected void execute(LogicClient.ReqLoginLogin message) {
        // TODO
        NetUtil.write(channel, LogicClient.ResLoginLogin.newBuilder().setError(Global.Error.SYS_ERR));
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