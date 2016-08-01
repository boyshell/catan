package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanSetHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanSet> {
    @Override
    protected void execute(LogicClient.ResCatanSet message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
