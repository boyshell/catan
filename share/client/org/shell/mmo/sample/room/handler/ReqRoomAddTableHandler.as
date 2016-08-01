package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqRoomAddTableHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ReqRoomAddTable> {
    @Override
    protected void execute(LogicClient.ReqRoomAddTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
