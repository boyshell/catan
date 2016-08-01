package org.shell.mmo.sample.room.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.Room;
import org.shell.mmo.sample.room.RoomMessageHandler;
import org.shell.mmo.sample.room.RoomService;

public class ReqRoomEnterHandler extends RoomMessageHandler<LogicClient.ReqRoomEnter> {
    @Inject
    RoomService roomService;

    @Override
    protected void execute(LogicClient.ReqRoomEnter message) {
        Room room = roomService.getRoom(account);
        if (room != null) {
            if (roomService.id(room) == message.getId()) {
                // TODO in room
                return;
            }
            roomService.remove(room, account);
        }
        room = roomService.getRoom(message.getId());
        if (room == null) {
            NetUtil.write(channel, error(Global.Error.ROOM_NULL));
            return;
        }
        roomService.add(room, account);
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResRoomEnter.newBuilder().setError(e).build();
    }
}
