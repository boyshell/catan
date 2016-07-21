package org.shell.mmo.sample.message;

import com.google.protobuf.MessageLite;
import com.google.protobuf.Parser;

import java.util.HashMap;
import java.util.Map;

/**
 * do not edit
 */
public class LogicHandlerGroup {
    public static Map<Parser<? extends MessageLite>, Class<? extends com.shell.mmo.utils.net.message.MessageHandler>> create() {
        Map<Parser<? extends MessageLite>, Class<? extends com.shell.mmo.utils.net.message.MessageHandler>> map = new HashMap<>();
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResLoginLogin.PARSER, org.shell.mmo.sample.login.handler.ResLoginLoginHandler.class);
        map.put(org.shell.mmo.sample.message.proto.SceneClient.ResFightUseSkill.PARSER, org.shell.mmo.sample.fight.handler.ResFightUseSkillHandler.class);
        map.put(org.shell.mmo.sample.message.proto.SceneClient.ReqFightShowDamage.PARSER, org.shell.mmo.sample.fight.handler.ReqFightShowDamageHandler.class);
        map.put(org.shell.mmo.sample.message.proto.SceneClient.ResMoveWalk.PARSER, org.shell.mmo.sample.move.handler.ResMoveWalkHandler.class);
        return map;
    }
}
