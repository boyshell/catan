package org.shell.mmo.sample.login.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqLoginReplaceHandler extends org.shell.mmo.sample.message.ChannelMessageHandler<LogicClient.ReqLoginReplace> {
    @Override
    protected void execute(LogicClient.ReqLoginReplace message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.LOGIN;
    }
}
