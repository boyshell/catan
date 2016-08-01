package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.TableMessageHandler;

public class ReqTableRemoveHandler extends TableMessageHandler<LogicClient.ReqTableRemove> {
    @Override
    protected void execute(LogicClient.ReqTableRemove message) {
        room.getTables().remove(message.getId());
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

}
