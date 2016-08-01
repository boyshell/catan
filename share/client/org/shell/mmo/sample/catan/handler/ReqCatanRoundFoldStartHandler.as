package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanRoundFoldStartHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanRoundFoldStart> {
    @Override
    protected void execute(LogicClient.ReqCatanRoundFoldStart message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
