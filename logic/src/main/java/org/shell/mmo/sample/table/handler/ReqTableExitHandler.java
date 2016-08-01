package org.shell.mmo.sample.table.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.TableService;

public class ReqTableExitHandler extends org.shell.mmo.sample.table.TableMessageHandler<LogicClient.ReqTableExit> {
    @Inject
    TableService tableService;

    @Override
    protected void execute(LogicClient.ReqTableExit message) {
        // 是否在桌子中?
        if (table == null) {
            NetUtil.write(channel, error(Global.Error.TABLE_NOT_IN));
            return;
        }
        // 是否已经开始?
        if (tableService.start(table)) {
            NetUtil.write(channel, error(Global.Error.TABLE_START));
            return;
        }
        tableService.remove(room, table, account);
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResTableExit.newBuilder().setError(e).build();
    }
}
