package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanStartHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanStart> {
    @Override
    protected void execute(LogicClient.ResCatanStart message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
