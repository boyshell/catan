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
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqLoginReplace.PARSER, org.shell.mmo.sample.login.handler.ReqLoginReplaceHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqLoginConfig.PARSER, org.shell.mmo.sample.login.handler.ReqLoginConfigHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResRoleCreateRole.PARSER, org.shell.mmo.sample.role.handler.ResRoleCreateRoleHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResRoomEnter.PARSER, org.shell.mmo.sample.room.handler.ResRoomEnterHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResRoomExit.PARSER, org.shell.mmo.sample.room.handler.ResRoomExitHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqRoomAll.PARSER, org.shell.mmo.sample.room.handler.ReqRoomAllHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqRoomUpdate.PARSER, org.shell.mmo.sample.room.handler.ReqRoomUpdateHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResTableCreate.PARSER, org.shell.mmo.sample.table.handler.ResTableCreateHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqTableAdd.PARSER, org.shell.mmo.sample.table.handler.ReqTableAddHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResTableJoin.PARSER, org.shell.mmo.sample.table.handler.ResTableJoinHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqTableUpdate.PARSER, org.shell.mmo.sample.table.handler.ReqTableUpdateHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResTableExit.PARSER, org.shell.mmo.sample.table.handler.ResTableExitHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqTableRemove.PARSER, org.shell.mmo.sample.table.handler.ReqTableRemoveHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResTableReady.PARSER, org.shell.mmo.sample.table.handler.ResTableReadyHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanStart.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanStartHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundInitStart.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanRoundInitStartHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanSet.PARSER, org.shell.mmo.sample.catan.handler.ResCatanSetHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundCommonStart.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanRoundCommonStartHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoundCommonEnd.PARSER, org.shell.mmo.sample.catan.handler.ResCatanRoundCommonEndHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildRoad.PARSER, org.shell.mmo.sample.catan.handler.ResCatanBuildRoadHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildCountry.PARSER, org.shell.mmo.sample.catan.handler.ResCatanBuildCountryHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildCity.PARSER, org.shell.mmo.sample.catan.handler.ResCatanBuildCityHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildDevelopmentCard.PARSER, org.shell.mmo.sample.catan.handler.ResCatanBuildDevelopmentCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeSystem.PARSER, org.shell.mmo.sample.catan.handler.ResCatanTradeSystemHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeOffer.PARSER, org.shell.mmo.sample.catan.handler.ResCatanTradeOfferHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCounterOffer.PARSER, org.shell.mmo.sample.catan.handler.ResCatanTradeCounterOfferHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferToMe.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanTradeCounterOfferToMeHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCounterOfferRefuse.PARSER, org.shell.mmo.sample.catan.handler.ResCatanTradeCounterOfferRefuseHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferRefuseToMe.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanTradeCounterOfferRefuseToMeHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeDeal.PARSER, org.shell.mmo.sample.catan.handler.ResCatanTradeDealHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCancel.PARSER, org.shell.mmo.sample.catan.handler.ResCatanTradeCancelHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanRob.PARSER, org.shell.mmo.sample.catan.handler.ResCatanRobHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanRichCard.PARSER, org.shell.mmo.sample.catan.handler.ResCatanRichCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoadCard.PARSER, org.shell.mmo.sample.catan.handler.ResCatanRoadCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanKnightCard.PARSER, org.shell.mmo.sample.catan.handler.ResCatanKnightCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanMonopolyCard.PARSER, org.shell.mmo.sample.catan.handler.ResCatanMonopolyCardHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundFoldStart.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanRoundFoldStartHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ResCatanFold.PARSER, org.shell.mmo.sample.catan.handler.ResCatanFoldHandler.class);
        map.put(org.shell.mmo.sample.message.proto.LogicClient.ReqCatanDone.PARSER, org.shell.mmo.sample.catan.handler.ReqCatanDoneHandler.class);
        return map;
    }
}
