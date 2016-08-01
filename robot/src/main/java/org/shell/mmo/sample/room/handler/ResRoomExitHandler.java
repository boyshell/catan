package org.shell.mmo.sample.room.handler;

import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ResRoomExitHandler extends org.shell.mmo.sample.room.RoomMessageHandler<LogicClient.ResRoomExit> {
    @Override
    protected void execute(LogicClient.ResRoomExit message) {
        account.getRole().getRoom().setId(-1);
        account.getRole().getTable().getMasters().clear();
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }

}
