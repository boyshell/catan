package org.shell.mmo.sample.room.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.RoomService;

public class ReqRoomAllHandler extends org.shell.mmo.sample.room.RoomMessageHandler<LogicClient.ReqRoomAll> {
    @Inject
    RoomService roomService;

    @Override
    protected void execute(LogicClient.ReqRoomAll message) {
        for (Global.GameRoom room : message.getRoomList()) {
            roomService.add(roomService.create(room));
        }
        // 进入房间
        NetUtil.write(channel, LogicClient.ReqRoomEnter.newBuilder().setId(message.getRoom(0).getId()));
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }

}
