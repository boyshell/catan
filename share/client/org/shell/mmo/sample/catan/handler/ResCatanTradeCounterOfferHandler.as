package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanTradeCounterOfferHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanTradeCounterOffer> {
    @Override
    protected void execute(LogicClient.ResCatanTradeCounterOffer message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}