package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanRichCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanRichCard> {
    @Override
    protected void execute(LogicClient.ResCatanRichCard message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
