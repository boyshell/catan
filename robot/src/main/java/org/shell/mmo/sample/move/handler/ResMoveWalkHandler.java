package org.shell.mmo.sample.move.handler;

import org.shell.mmo.sample.message.proto.SceneClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResMoveWalkHandler extends org.shell.mmo.sample.message.MessageHandler<SceneClient.ResMoveWalk> {
    @Override
    protected void execute(SceneClient.ResMoveWalk message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.MOVE;
    }

}
