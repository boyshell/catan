package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanRemoveTableHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanRemoveTable> {
    @Override
    protected void execute(LogicClient.ReqCatanRemoveTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
