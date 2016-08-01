package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanRoundCommonEndHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanRoundCommonEnd> {
    @Override
    protected void execute(LogicClient.ReqCatanRoundCommonEnd message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoundCommonEnd.newBuilder().setError(e).build();
    }
}
