package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanBuildCityHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanBuildCity> {
    @Override
    protected void execute(LogicClient.ResCatanBuildCity message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
