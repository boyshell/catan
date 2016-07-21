package org.shell.mmo.sample.fight.handler;

import org.shell.mmo.sample.message.proto.SceneClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqFightUseSkillHandler extends org.shell.mmo.sample.message.MessageHandler<SceneClient.ReqFightUseSkill> {
    @Override
    protected void execute(SceneClient.ReqFightUseSkill message) {
        // TODO
    }

    @Override
    public Module module() {
        return Module.FIGHT;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.SceneClient.ResFightUseSkill.newBuilder().setError(e).build();
    }
}
