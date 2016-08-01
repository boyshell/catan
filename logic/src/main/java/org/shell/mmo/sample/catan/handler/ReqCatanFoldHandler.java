package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanFoldHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanFold> {
    @Override
    protected void execute(LogicClient.ReqCatanFold message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanFold.newBuilder().setError(e).build();
    }
}
