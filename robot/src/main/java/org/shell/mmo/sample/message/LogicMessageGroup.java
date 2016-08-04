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
        builder.put((short)256, org.shell.mmo.sample.message.proto.LogicClient.ResLoginLogin.PARSER);
        builder.put((short)259, org.shell.mmo.sample.message.proto.LogicClient.ReqLoginReplace.PARSER);
        builder.put((short)261, org.shell.mmo.sample.message.proto.LogicClient.ReqLoginConfig.PARSER);
        builder.put((short)513, org.shell.mmo.sample.message.proto.LogicClient.ReqRoleCreateRole.PARSER);
        builder.put((short)512, org.shell.mmo.sample.message.proto.LogicClient.ResRoleCreateRole.PARSER);
        builder.put((short)769, org.shell.mmo.sample.message.proto.LogicClient.ReqRoomEnter.PARSER);
        builder.put((short)768, org.shell.mmo.sample.message.proto.LogicClient.ResRoomEnter.PARSER);
        builder.put((short)771, org.shell.mmo.sample.message.proto.LogicClient.ReqRoomExit.PARSER);
        builder.put((short)770, org.shell.mmo.sample.message.proto.LogicClient.ResRoomExit.PARSER);
        builder.put((short)773, org.shell.mmo.sample.message.proto.LogicClient.ReqRoomAll.PARSER);
        builder.put((short)775, org.shell.mmo.sample.message.proto.LogicClient.ReqRoomUpdate.PARSER);
        builder.put((short)1025, org.shell.mmo.sample.message.proto.LogicClient.ReqTableCreate.PARSER);
        builder.put((short)1024, org.shell.mmo.sample.message.proto.LogicClient.ResTableCreate.PARSER);
        builder.put((short)1027, org.shell.mmo.sample.message.proto.LogicClient.ReqTableAdd.PARSER);
        builder.put((short)1029, org.shell.mmo.sample.message.proto.LogicClient.ReqTableJoin.PARSER);
        builder.put((short)1028, org.shell.mmo.sample.message.proto.LogicClient.ResTableJoin.PARSER);
        builder.put((short)1031, org.shell.mmo.sample.message.proto.LogicClient.ReqTableUpdate.PARSER);
        builder.put((short)1033, org.shell.mmo.sample.message.proto.LogicClient.ReqTableExit.PARSER);
        builder.put((short)1032, org.shell.mmo.sample.message.proto.LogicClient.ResTableExit.PARSER);
        builder.put((short)1035, org.shell.mmo.sample.message.proto.LogicClient.ReqTableRemove.PARSER);
        builder.put((short)1037, org.shell.mmo.sample.message.proto.LogicClient.ReqTableReady.PARSER);
        builder.put((short)1036, org.shell.mmo.sample.message.proto.LogicClient.ResTableReady.PARSER);
        builder.put((short)1281, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanStart.PARSER);
        builder.put((short)1283, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundInitStart.PARSER);
        builder.put((short)1285, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanSet.PARSER);
        builder.put((short)1284, org.shell.mmo.sample.message.proto.LogicClient.ResCatanSet.PARSER);
        builder.put((short)1287, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundCommonStart.PARSER);
        builder.put((short)1289, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundCommonEnd.PARSER);
        builder.put((short)1288, org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoundCommonEnd.PARSER);
        builder.put((short)1291, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildRoad.PARSER);
        builder.put((short)1290, org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildRoad.PARSER);
        builder.put((short)1293, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildCountry.PARSER);
        builder.put((short)1292, org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildCountry.PARSER);
        builder.put((short)1295, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildCity.PARSER);
        builder.put((short)1294, org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildCity.PARSER);
        builder.put((short)1297, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildDevelopmentCard.PARSER);
        builder.put((short)1296, org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildDevelopmentCard.PARSER);
        builder.put((short)1299, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeSystem.PARSER);
        builder.put((short)1298, org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeSystem.PARSER);
        builder.put((short)1301, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeOffer.PARSER);
        builder.put((short)1300, org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeOffer.PARSER);
        builder.put((short)1303, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOffer.PARSER);
        builder.put((short)1302, org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCounterOffer.PARSER);
        builder.put((short)1305, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferToMe.PARSER);
        builder.put((short)1307, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferRefuse.PARSER);
        builder.put((short)1306, org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCounterOfferRefuse.PARSER);
        builder.put((short)1309, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferRefuseToMe.PARSER);
        builder.put((short)1311, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeDeal.PARSER);
        builder.put((short)1310, org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeDeal.PARSER);
        builder.put((short)1313, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCancel.PARSER);
        builder.put((short)1312, org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCancel.PARSER);
        builder.put((short)1315, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRob.PARSER);
        builder.put((short)1314, org.shell.mmo.sample.message.proto.LogicClient.ResCatanRob.PARSER);
        builder.put((short)1317, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRichCard.PARSER);
        builder.put((short)1316, org.shell.mmo.sample.message.proto.LogicClient.ResCatanRichCard.PARSER);
        builder.put((short)1319, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoadCard.PARSER);
        builder.put((short)1318, org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoadCard.PARSER);
        builder.put((short)1321, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanKnightCard.PARSER);
        builder.put((short)1320, org.shell.mmo.sample.message.proto.LogicClient.ResCatanKnightCard.PARSER);
        builder.put((short)1323, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanMonopolyCard.PARSER);
        builder.put((short)1322, org.shell.mmo.sample.message.proto.LogicClient.ResCatanMonopolyCard.PARSER);
        builder.put((short)1325, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundFoldStart.PARSER);
        builder.put((short)1327, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanFold.PARSER);
        builder.put((short)1326, org.shell.mmo.sample.message.proto.LogicClient.ResCatanFold.PARSER);
        builder.put((short)1329, org.shell.mmo.sample.message.proto.LogicClient.ReqCatanDone.PARSER);

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
