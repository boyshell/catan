package org.shell.mmo.sample.room.handler;

import com.google.inject.Inject;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.Room;
import org.shell.mmo.sample.room.RoomService;

public class ReqRoomUpdateHandler extends org.shell.mmo.sample.room.RoomMessageHandler<LogicClient.ReqRoomUpdate> {
    @Inject
    RoomService roomService;

    @Override
    protected void execute(LogicClient.ReqRoomUpdate message) {
        Room room = roomService.getRoom(message.getId());
        room.setCount(message.getCount());
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }

}
