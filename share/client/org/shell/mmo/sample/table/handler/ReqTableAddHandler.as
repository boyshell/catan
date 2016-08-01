package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqTableAddHandler extends org.shell.mmo.sample.message.RoomMessageHandler<LogicClient.ReqTableAdd> {
    @Override
    protected void execute(LogicClient.ReqTableAdd message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }
}
