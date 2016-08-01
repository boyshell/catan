package org.shell.mmo.sample.room.handler;

import com.google.inject.Inject;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.Room;
import org.shell.mmo.sample.room.RoomService;

public class ReqRoomExitHandler extends org.shell.mmo.sample.room.RoomMessageHandler<LogicClient.ReqRoomExit> {
    @Inject
    AccountService accountService;
    @Inject
    RoomService roomService;

    @Override
    protected void execute(LogicClient.ReqRoomExit message) {
        Room room = roomService.getRoom(account);
        if (room == null) {
            accountService.write(account, error(Global.Error.ROOM_NULL));
            return;
        }
        roomService.remove(room, account);
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResRoomExit.newBuilder().setError(e).build();
    }
}
