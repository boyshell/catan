package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanFoldHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanFold> {
    @Override
    protected void execute(LogicClient.ResCatanFold message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
