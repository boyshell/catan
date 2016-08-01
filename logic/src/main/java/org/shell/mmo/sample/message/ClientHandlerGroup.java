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
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqLoginLogin.PARSER, org.shell.mmo.sample.login.handler.ReqLoginLoginHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqRoleCreateRole.PARSER, org.shell.mmo.sample.role.handler.ReqRoleCreateRoleHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqRoomEnter.PARSER, org.shell.mmo.sample.room.handler.ReqRoomEnterHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqRoomExit.PARSER, org.shell.mmo.sample.room.handler.ReqRoomExitHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqTableCreate.PARSER, org.shell.mmo.sample.table.handler.ReqTableCreateHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqTableJoin.PARSER, org.shell.mmo.sample.table.handler.ReqTableJoinHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqTableExit.PARSER, org.shell.mmo.sample.table.handler.ReqTableExitHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqTableReady.PARSER, org.shell.mmo.sample.table.handler.ReqTableReadyHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanSet.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanSetHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundCommonEnd.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanRoundCommonEndHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildRoad.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanBuildRoadHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildCountry.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanBuildCountryHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildCity.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanBuildCityHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildDevelopmentCard.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanBuildDevelopmentCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeSystem.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanTradeSystemHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeOffer.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanTradeOfferHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOffer.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanTradeCounterOfferHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferRefuse.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanTradeCounterOfferRefuseHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeDeal.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanTradeDealHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCancel.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanTradeCancelHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRob.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanRobHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRichCard.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanRichCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoadCard.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanRoadCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanKnightCard.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanKnightCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanMonopolyCard.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanMonopolyCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanFold.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanFoldHandler.class);
        return map;
    }
}
