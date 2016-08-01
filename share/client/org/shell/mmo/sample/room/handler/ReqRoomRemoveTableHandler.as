package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqRoomRemoveTableHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ReqRoomRemoveTable> {
    @Override
    protected void execute(LogicClient.ReqRoomRemoveTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }
}
