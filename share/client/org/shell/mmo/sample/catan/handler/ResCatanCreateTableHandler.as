package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanCreateTableHandler extends org.shell.mmo.sample.message.CatanMessageHandler<LogicClient.ResCatanCreateTable> {
    @Override
    protected void execute(LogicClient.ResCatanCreateTable message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }
}
