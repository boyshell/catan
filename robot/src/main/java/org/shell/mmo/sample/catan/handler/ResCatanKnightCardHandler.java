package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanKnightCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanKnightCard> {
    @Override
    protected void execute(LogicClient.ResCatanKnightCard message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
