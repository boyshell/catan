package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqRoomUpdateHandler extends org.shell.mmo.sample.room.RoomMessageHandler<LogicClient.ReqRoomUpdate> {
    @Override
    protected void execute(LogicClient.ReqRoomUpdate message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }

}
