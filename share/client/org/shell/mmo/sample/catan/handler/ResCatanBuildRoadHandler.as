package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanBuildRoadHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanBuildRoad> {
    @Override
    protected void execute(LogicClient.ResCatanBuildRoad message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
