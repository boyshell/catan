package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanRobHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanRob> {
    @Override
    protected void execute(LogicClient.ResCatanRob message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
