package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResRoomExitHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResRoomExit> {
    @Override
    protected void execute(LogicClient.ResRoomExit message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
