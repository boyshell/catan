package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanRoundEndHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanRoundEnd> {
    @Override
    protected void execute(LogicClient.ResCatanRoundEnd message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
