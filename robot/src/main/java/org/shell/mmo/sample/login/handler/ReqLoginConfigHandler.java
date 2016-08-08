package org.shell.mmo.sample.login.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqLoginConfigHandler extends org.shell.mmo.sample.login.LoginMessageHandler<LogicClient.ReqLoginConfig> {
    @Override
    protected void execute(LogicClient.ReqLoginConfig message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.LOGIN;
    }

}
