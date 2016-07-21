package org.shell.mmo.sample.message;

import com.google.protobuf.MessageLite;
import com.google.protobuf.Parser;

import java.util.HashMap;
import java.util.Map;

/**
 * do not edit
 */
public class ClientHandlerGroup {
    public static Map<Parser<? extends MessageLite>, Class<? extends com.shell.mmo.utils.net.message.MessageHandler>> create() {
        Map<Parser<? extends MessageLite>, Class<? extends com.shell.mmo.utils.net.message.MessageHandler>> map = new HashMap<>();
        map.put(org.shell.mmo.sample.message.proto.SceneClient.ReqFightUseSkill.PARSER, org.shell.mmo.sample.fight.handler.ReqFightUseSkillHandler.class);
        map.put(org.shell.mmo.sample.message.proto.SceneClient.ReqMoveWalk.PARSER, org.shell.mmo.sample.move.handler.ReqMoveWalkHandler.class);
        return map;
    }
}
