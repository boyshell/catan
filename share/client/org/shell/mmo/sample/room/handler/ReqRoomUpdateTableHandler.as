package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqRoomUpdateTableHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ReqRoomUpdateTable> {
    @Override
    protected void execute(LogicClient.ReqRoomUpdateTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
