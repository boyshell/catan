package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanAddTableHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ReqCatanAddTable> {
    @Override
    protected void execute(LogicClient.ReqCatanAddTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
