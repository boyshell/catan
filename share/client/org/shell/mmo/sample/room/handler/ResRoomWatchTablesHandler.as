package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResRoomWatchTablesHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResRoomWatchTables> {
    @Override
    protected void execute(LogicClient.ResRoomWatchTables message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
