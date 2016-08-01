package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResRoomJoinTableHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResRoomJoinTable> {
    @Override
    protected void execute(LogicClient.ResRoomJoinTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
