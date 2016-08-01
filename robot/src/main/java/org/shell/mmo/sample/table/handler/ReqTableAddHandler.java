package org.shell.mmo.sample.table.handler;

import com.google.inject.Inject;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.TableMessageHandler;
import org.shell.mmo.sample.table.TableService;

public class ReqTableAddHandler extends TableMessageHandler<LogicClient.ReqTableAdd> {
    @Inject
    TableService tableService;

    @Override
    protected void execute(LogicClient.ReqTableAdd message) {
        room.getTables().put(message.getTable().getId(), tableService.create(message.getTable()));
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

}
