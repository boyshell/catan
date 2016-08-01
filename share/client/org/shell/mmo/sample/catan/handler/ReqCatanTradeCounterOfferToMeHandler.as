package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanTradeCounterOfferToMeHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanTradeCounterOfferToMe> {
    @Override
    protected void execute(LogicClient.ReqCatanTradeCounterOfferToMe message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
