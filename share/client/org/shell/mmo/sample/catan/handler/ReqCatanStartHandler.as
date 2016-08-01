package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanStartHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanStart> {
    @Override
    protected void execute(LogicClient.ReqCatanStart message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
