package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResRoomReadyHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ResRoomReady> {
    @Override
    protected void execute(LogicClient.ResRoomReady message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
