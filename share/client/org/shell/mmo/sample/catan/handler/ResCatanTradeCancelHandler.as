package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanTradeCancelHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanTradeCancel> {
    @Override
    protected void execute(LogicClient.ResCatanTradeCancel message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
