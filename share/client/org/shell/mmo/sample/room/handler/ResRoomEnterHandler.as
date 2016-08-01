package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResRoomEnterHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResRoomEnter> {
    @Override
    protected void execute(LogicClient.ResRoomEnter message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
