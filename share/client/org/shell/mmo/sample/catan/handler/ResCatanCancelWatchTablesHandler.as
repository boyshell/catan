package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanCancelWatchTablesHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanCancelWatchTables> {
    @Override
    protected void execute(LogicClient.ResCatanCancelWatchTables message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
