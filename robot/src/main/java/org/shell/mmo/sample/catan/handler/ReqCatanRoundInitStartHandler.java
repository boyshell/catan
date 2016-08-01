package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanRoundInitStartHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanRoundInitStart> {
    @Override
    protected void execute(LogicClient.ReqCatanRoundInitStart message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
