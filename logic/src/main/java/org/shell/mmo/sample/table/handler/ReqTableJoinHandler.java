package org.shell.mmo.sample.table.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.Table;
import org.shell.mmo.sample.table.TableService;

public class ReqTableJoinHandler extends org.shell.mmo.sample.table.TableMessageHandler<LogicClient.ReqTableJoin> {
    @Inject
    TableService tableService;

    @Override
    protected void execute(LogicClient.ReqTableJoin message) {
        // 已经在桌子中?
        if (this.table != null) {
            NetUtil.write(channel, error(Global.Error.TABLE_IN));
            return;
        }
        Table table = tableService.getTable(room, message.getId());
        if (table == null) {
            NetUtil.write(channel, error(Global.Error.TABLE_NULL));
            return;
        }
        // 已经开始了?
        if (tableService.start(table)) {
            NetUtil.write(channel, error(Global.Error.TABLE_START));
            return;
        }
        // 人数?
        if (tableService.count(table) >= tableService.max(table)) {
            NetUtil.write(channel, error(Global.Error.TABLE_FULL));
            return;
        }
        // 密码验证?
        if (tableService.pwd(table) != null
                && (!message.hasPwd() || !tableService.pwd(table).equals(message.getPwd()))) {
            NetUtil.write(channel, error(Global.Error.TABLE_PWD_ERROR));
            return;
        }
        tableService.add(room, table, account);
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResTableJoin.newBuilder().setError(e).build();
    }
}
