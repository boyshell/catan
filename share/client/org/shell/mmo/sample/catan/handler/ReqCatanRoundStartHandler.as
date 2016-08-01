package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanRoundStartHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanRoundStart> {
    @Override
    protected void execute(LogicClient.ReqCatanRoundStart message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
