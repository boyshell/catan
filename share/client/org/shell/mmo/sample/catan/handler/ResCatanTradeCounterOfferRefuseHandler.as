package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanTradeCounterOfferRefuseHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanTradeCounterOfferRefuse> {
    @Override
    protected void execute(LogicClient.ResCatanTradeCounterOfferRefuse message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
