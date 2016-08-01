package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResTableJoinHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResTableJoin> {
    @Override
    protected void execute(LogicClient.ResTableJoin message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }
}
