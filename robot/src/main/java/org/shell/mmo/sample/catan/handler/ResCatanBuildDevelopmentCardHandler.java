package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanBuildDevelopmentCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanBuildDevelopmentCard> {
    @Override
    protected void execute(LogicClient.ResCatanBuildDevelopmentCard message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
