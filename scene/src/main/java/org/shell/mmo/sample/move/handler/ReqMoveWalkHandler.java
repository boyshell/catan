package org.shell.mmo.sample.move.handler;

import org.shell.mmo.sample.message.proto.SceneClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqMoveWalkHandler extends org.shell.mmo.sample.message.MessageHandler<SceneClient.ReqMoveWalk> {
    @Override
    protected void execute(SceneClient.ReqMoveWalk message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.MOVE;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.SceneClient.ResMoveWalk.newBuilder().setError(e).build();
    }
}
