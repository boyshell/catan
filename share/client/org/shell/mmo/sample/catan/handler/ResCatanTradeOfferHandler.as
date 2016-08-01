package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanTradeOfferHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanTradeOffer> {
    @Override
    protected void execute(LogicClient.ResCatanTradeOffer message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
