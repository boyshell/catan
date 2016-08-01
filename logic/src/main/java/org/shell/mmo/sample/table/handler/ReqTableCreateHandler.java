package org.shell.mmo.sample.table.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.config.ConfigGroup;
import org.shell.mmo.sample.config.bean.CcatanMap;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.RoomService;
import org.shell.mmo.sample.table.Table;
import org.shell.mmo.sample.table.TableService;

public class ReqTableCreateHandler extends org.shell.mmo.sample.table.TableMessageHandler<LogicClient.ReqTableCreate> {

    @Inject
    TableService tableService;
    @Inject
    ConfigGroup configGroup;
    @Inject
    RoomService roomService;

    @Override
    protected void execute(LogicClient.ReqTableCreate message) {
        if (table != null) {
            NetUtil.write(channel, error(Global.Error.TABLE_IN));
            return;
        }
        if (!message.hasName() || message.getName().isEmpty()) {
            NetUtil.write(channel, error(Global.Error.TABLE_NAME_NULL));
            return;
        }
        if (message.hasPwd() && message.getPwd().length() > 16) {
            NetUtil.write(channel, error(Global.Error.TABLE_PWD_TOO_LONG));
            return;
        }
        /** ===================================== 类型绑定代码 start */
        Global.RoomType type = roomService.type(room);
        if (type != Global.RoomType.ROOM_CATAN) {
            throw new IllegalArgumentException("room type:" + type.toString());
        }
        CcatanMap ccatanMap = configGroup.catanMapContainer.getMap().get(message.getMap());
        if (ccatanMap == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_MAP_ILLEGAL));
            return;
        }
        int max = ccatanMap.getMax();
        int min = ccatanMap.getMin();
        /** ===================================== 类型绑定代码 end */
        Table table = tableService.createTable(
                room
                , message.getName()
                , (!message.hasPwd() || message.getPwd().isEmpty()) ? null : message.getPwd()
                , message.getMap()
                , max
                , min
        );
        tableService.add(room, table, account);
        NetUtil.write(channel, LogicClient.ResTableCreate.newBuilder().setId(tableService.id(table)));
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResTableCreate.newBuilder().setError(e).build();
    }
}
