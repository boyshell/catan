package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanBuildCountryHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanBuildCountry> {
    @Override
    protected void execute(LogicClient.ResCatanBuildCountry message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
