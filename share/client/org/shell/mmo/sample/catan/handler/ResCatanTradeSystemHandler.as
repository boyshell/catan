package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanTradeSystemHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanTradeSystem> {
    @Override
    protected void execute(LogicClient.ResCatanTradeSystem message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
