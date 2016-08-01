package org.shell.mmo.sample.login.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResLoginNetTestHandler extends org.shell.mmo.sample.message.ChannelMessageHandler<LogicClient.ResLoginNetTest> {
    @Override
    protected void execute(LogicClient.ResLoginNetTest message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.LOGIN;
    }
}
