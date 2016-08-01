package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.Table;
import org.shell.mmo.sample.table.TableMessageHandler;

public class ReqTableUpdateHandler extends TableMessageHandler<LogicClient.ReqTableUpdate> {

    @Override
    protected void execute(LogicClient.ReqTableUpdate message) {
        Table table = room.getTables().get(message.getId());
        table.setCount(message.getId());
        table.setStart(message.getStart());
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

}
