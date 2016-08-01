package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResTableReadyHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResTableReady> {
    @Override
    protected void execute(LogicClient.ResTableReady message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }
}
