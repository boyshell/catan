package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqTableRemoveHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ReqTableRemove> {
    @Override
    protected void execute(LogicClient.ReqTableRemove message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }
}
