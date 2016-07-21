package org.shell.mmo.sample.login.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResLoginLoginHandler extends org.shell.mmo.sample.message.MessageHandler<LogicClient.ResLoginLogin> {
    @Override
    protected void execute(LogicClient.ResLoginLogin message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.LOGIN;
    }
}
