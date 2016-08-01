package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqTableUpdateHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ReqTableUpdate> {
    @Override
    protected void execute(LogicClient.ReqTableUpdate message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }
}
