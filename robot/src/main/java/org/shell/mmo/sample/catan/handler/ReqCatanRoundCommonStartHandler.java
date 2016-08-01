package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanRoundCommonStartHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanRoundCommonStart> {
    @Override
    protected void execute(LogicClient.ReqCatanRoundCommonStart message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
