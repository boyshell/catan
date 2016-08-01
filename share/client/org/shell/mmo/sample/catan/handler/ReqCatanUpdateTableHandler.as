package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanUpdateTableHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanUpdateTable> {
    @Override
    protected void execute(LogicClient.ReqCatanUpdateTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
