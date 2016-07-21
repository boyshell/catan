package org.shell.mmo.sample.message;

import com.google.common.collect.ImmutableBiMap;
import com.google.common.collect.ImmutableMap;
import com.google.protobuf.MessageLite;
import com.google.protobuf.Parser;

/**
 * do not edit
 */
public class LogicMessageGroup {
    private static ImmutableMap<Short, Parser<? extends MessageLite>> id2parser;
    private static ImmutableMap<Parser<? extends MessageLite>, Short> parser2id;

    static {
        ImmutableBiMap.Builder<Short, Parser<? extends MessageLite>> builder = ImmutableBiMap.builder();

        builder.put((short)257, org.shell.mmo.sample.message.proto.LogicClient.ReqLoginLogin.PARSER);
        builder.put((short)257, org.shell.mmo.sample.message.proto.LogicClient.ResLoginLogin.PARSER);
        builder.put((short)513, org.shell.mmo.sample.message.proto.SceneClient.ReqFightUseSkill.PARSER);
        builder.put((short)513, org.shell.mmo.sample.message.proto.SceneClient.ResFightUseSkill.PARSER);
        builder.put((short)641, org.shell.mmo.sample.message.proto.SceneClient.ReqFightShowDamage.PARSER);
        builder.put((short)769, org.shell.mmo.sample.message.proto.SceneClient.ReqMoveWalk.PARSER);
        builder.put((short)769, org.shell.mmo.sample.message.proto.SceneClient.ResMoveWalk.PARSER);

        ImmutableBiMap<Short, Parser<? extends MessageLite>> biMap = builder.build();
        id2parser = ImmutableMap.copyOf(biMap.entrySet());
        parser2id = ImmutableMap.copyOf(biMap.inverse().entrySet());
    }

    public static ImmutableMap<Short, Parser<? extends MessageLite>> id2parser() {
        return id2parser;
    }

    public static ImmutableMap<Parser<? extends MessageLite>, Short> parser2id() {
        return parser2id;
    }
}
