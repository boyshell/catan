package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqRoomAllHandler extends org.shell.mmo.sample.room.RoomMessageHandler<LogicClient.ReqRoomAll> {
    @Override
    protected void execute(LogicClient.ReqRoomAll message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }

}
