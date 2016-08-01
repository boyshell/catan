package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanReadyHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanReady> {
    @Override
    protected void execute(LogicClient.ResCatanReady message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
