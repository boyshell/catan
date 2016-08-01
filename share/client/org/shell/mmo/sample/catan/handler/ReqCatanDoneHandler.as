package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanDoneHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanDone> {
    @Override
    protected void execute(LogicClient.ReqCatanDone message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
