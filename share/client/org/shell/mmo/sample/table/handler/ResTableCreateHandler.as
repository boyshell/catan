package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResTableCreateHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResTableCreate> {
    @Override
    protected void execute(LogicClient.ResTableCreate message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }
}
