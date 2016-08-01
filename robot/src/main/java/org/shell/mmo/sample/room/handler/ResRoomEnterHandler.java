package org.shell.mmo.sample.room.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.Room;
import org.shell.mmo.sample.room.RoomService;
import org.shell.mmo.sample.table.Table;
import org.shell.mmo.sample.table.TableService;

public class ResRoomEnterHandler extends org.shell.mmo.sample.room.RoomMessageHandler<LogicClient.ResRoomEnter> {
    @Inject
    TableService tableService;
    @Inject
    RoomService roomService;

    @Override
    protected void execute(LogicClient.ResRoomEnter message) {
        account.getRole().getRoom().setId(message.getId());

        Room room = roomService.getRoom(message.getId());
        for (Global.GameTable table : message.getTableList()) {
            room.getTables().put(table.getId(), tableService.create(table));
        }

        for (Table table : room.getTables().values()) { // TODO 处理为线程安全
            if (table.isStart()) {
                continue;
            }
            if (table.getCount() >= table.getMax()) {
                continue;
            }
            NetUtil.write(channel, LogicClient.ReqTableJoin.newBuilder().setId(table.getId()).setPwd(table.isPwd() ? "pwd" : ""));
            return;
        }

        LogicClient.ReqTableCreate.Builder msg = LogicClient.ReqTableCreate.newBuilder().setMap(1).setName(account.getUsr());
        if (account.isAdult()) msg.setPwd("pwd");
        NetUtil.write(channel, msg);
    }

    @Override
    public Module module() {
        return Module.ROOM;
    }

}
