package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanMonopolyCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanMonopolyCard> {
    @Override
    protected void execute(LogicClient.ResCatanMonopolyCard message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
