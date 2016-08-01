package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanTradeCounterOfferRefuseToMeHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanTradeCounterOfferRefuseToMe> {
    @Override
    protected void execute(LogicClient.ReqCatanTradeCounterOfferRefuseToMe message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
