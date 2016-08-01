package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanWatchTablesHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanWatchTables> {
    @Override
    protected void execute(LogicClient.ResCatanWatchTables message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
