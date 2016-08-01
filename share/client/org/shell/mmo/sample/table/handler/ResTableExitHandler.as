package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResTableExitHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResTableExit> {
    @Override
    protected void execute(LogicClient.ResTableExit message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }
}
