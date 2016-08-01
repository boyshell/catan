package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanCountDownHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanCountDown> {
    @Override
    protected void execute(LogicClient.ReqCatanCountDown message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
