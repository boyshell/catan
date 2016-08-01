package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanRoadCardHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanRoadCard> {
    @Override
    protected void execute(LogicClient.ResCatanRoadCard message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
