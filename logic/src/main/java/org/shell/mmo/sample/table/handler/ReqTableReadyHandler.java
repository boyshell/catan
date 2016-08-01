package org.shell.mmo.sample.table.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.RoomService;
import org.shell.mmo.sample.table.TableService;

public class ReqTableReadyHandler extends org.shell.mmo.sample.table.TableMessageHandler<LogicClient.ReqTableReady> {
    @Inject
    TableService tableService;
    @Inject
    CatanService catanService;
    @Inject
    RoomService roomService;

    @Override
    protected void execute(LogicClient.ReqTableReady message) {
        // 有个桌子?
        if (table == null) {
            NetUtil.write(channel, error(Global.Error.TABLE_NOT_IN));
            return;
        }
        // 桌子还没有开始?
        if (tableService.start(table)) {
            NetUtil.write(channel, error(Global.Error.TABLE_START));
            return;
        }
        // 还没有准备?
        if (tableService.ready(table, account)) {
            NetUtil.write(channel, error(Global.Error.TABLE_READY));
            return;
        }
        tableService.write(table, LogicClient.ResTableReady.newBuilder().setId(account.getId()));

        if (tableService.count(table) < tableService.min(table)) {
            return;
        }

        if (!tableService.ready(table)) {
            return;
        }

        /** ===================================== 类型绑定代码 start */
        Global.RoomType type = roomService.type(room);
        if (type != Global.RoomType.ROOM_CATAN) {
            throw new IllegalArgumentException("room type:" + type.toString());
        }
        // 所有人都准备好了,开始吧
        tableService.startGame(room, table);
        /** ===================================== 类型绑定代码 end */
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResTableReady.newBuilder().setError(e).build();
    }
}
