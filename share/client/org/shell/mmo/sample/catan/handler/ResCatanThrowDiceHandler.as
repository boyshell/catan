package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanThrowDiceHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanThrowDice> {
    @Override
    protected void execute(LogicClient.ResCatanThrowDice message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
