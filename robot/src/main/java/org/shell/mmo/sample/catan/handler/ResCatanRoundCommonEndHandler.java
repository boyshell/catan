package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanRoundCommonEndHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanRoundCommonEnd> {
    @Override
    protected void execute(LogicClient.ResCatanRoundCommonEnd message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
