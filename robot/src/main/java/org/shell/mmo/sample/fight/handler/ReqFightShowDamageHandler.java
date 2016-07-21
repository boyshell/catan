package org.shell.mmo.sample.fight.handler;

import org.shell.mmo.sample.message.proto.SceneClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqFightShowDamageHandler extends org.shell.mmo.sample.message.MessageHandler<SceneClient.ReqFightShowDamage> {
    @Override
    protected void execute(SceneClient.ReqFightShowDamage message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.FIGHT;
    }

}
