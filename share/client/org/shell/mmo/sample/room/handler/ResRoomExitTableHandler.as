package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResRoomExitTableHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResRoomExitTable> {
    @Override
    protected void execute(LogicClient.ResRoomExitTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
