package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResRoomCreateTableHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResRoomCreateTable> {
    @Override
    protected void execute(LogicClient.ResRoomCreateTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}