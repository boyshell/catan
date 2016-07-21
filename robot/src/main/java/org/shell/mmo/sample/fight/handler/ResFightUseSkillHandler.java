package org.shell.mmo.sample.fight.handler;

import org.shell.mmo.sample.message.proto.SceneClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResFightUseSkillHandler extends org.shell.mmo.sample.message.MessageHandler<SceneClient.ResFightUseSkill> {
    @Override
    protected void execute(SceneClient.ResFightUseSkill message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.FIGHT;
    }

}
