package org.shell.mmo.sample.message {

    import org.shell.mmo.sample.message.proto.LogicClient.ReqLoginLogin;
    import org.shell.mmo.sample.message.proto.LogicClient.ResLoginLogin;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqLoginReplace;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqRoleCreateRole;
    import org.shell.mmo.sample.message.proto.LogicClient.ResRoleCreateRole;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqRoomEnter;
    import org.shell.mmo.sample.message.proto.LogicClient.ResRoomEnter;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqRoomExit;
    import org.shell.mmo.sample.message.proto.LogicClient.ResRoomExit;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqRoomAll;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqRoomUpdate;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqTableCreate;
    import org.shell.mmo.sample.message.proto.LogicClient.ResTableCreate;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqTableAdd;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqTableJoin;
    import org.shell.mmo.sample.message.proto.LogicClient.ResTableJoin;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqTableUpdate;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqTableExit;
    import org.shell.mmo.sample.message.proto.LogicClient.ResTableExit;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqTableRemove;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqTableReady;
    import org.shell.mmo.sample.message.proto.LogicClient.ResTableReady;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanStart;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundInitStart;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanSet;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanSet;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundCommonStart;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundCommonEnd;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoundCommonEnd;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildRoad;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildRoad;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildCountry;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildCountry;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildCity;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildCity;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanBuildDevelopmentCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildDevelopmentCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeSystem;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeSystem;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeOffer;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeOffer;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOffer;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCounterOffer;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferToMe;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferRefuse;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCounterOfferRefuse;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCounterOfferRefuseToMe;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeDeal;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeDeal;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanTradeCancel;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCancel;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRob;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanRob;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRichCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanRichCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoadCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoadCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanKnightCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanKnightCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanMonopolyCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanMonopolyCard;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanRoundFoldStart;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanFold;
    import org.shell.mmo.sample.message.proto.LogicClient.ResCatanFold;
    import org.shell.mmo.sample.message.proto.LogicClient.ReqCatanDone;

    import flash.utils.Dictionary;

    /**
     * do not edit
     */
    public class LogicMessageGroup {
        private var _id2message:Dictionary = new Dictionary();
        private var _message2id:Dictionary = new Dictionary();

        public function get message2id():Dictionary {
            return _message2id;
        }

        public function set message2id(value:Dictionary):void {
            _message2id = value;
        }

        public function get id2message():Dictionary {
            return _id2message;
        }

        public function set id2message(value:Dictionary):void {
            _id2message = value;
        }

        public function add(id:int, messageClass:Class):void {
            this.id2message[id] = messageClass;
            this.message2id[messageClass] = id;
        }

        public function LogicMessageGroup() {
            this.add(257, ReqLoginLogin);
            this.add(256, ResLoginLogin);
            this.add(259, ReqLoginReplace);
            this.add(513, ReqRoleCreateRole);
            this.add(512, ResRoleCreateRole);
            this.add(769, ReqRoomEnter);
            this.add(768, ResRoomEnter);
            this.add(771, ReqRoomExit);
            this.add(770, ResRoomExit);
            this.add(773, ReqRoomAll);
            this.add(775, ReqRoomUpdate);
            this.add(1025, ReqTableCreate);
            this.add(1024, ResTableCreate);
            this.add(1027, ReqTableAdd);
            this.add(1029, ReqTableJoin);
            this.add(1028, ResTableJoin);
            this.add(1031, ReqTableUpdate);
            this.add(1033, ReqTableExit);
            this.add(1032, ResTableExit);
            this.add(1035, ReqTableRemove);
            this.add(1037, ReqTableReady);
            this.add(1036, ResTableReady);
            this.add(1281, ReqCatanStart);
            this.add(1283, ReqCatanRoundInitStart);
            this.add(1285, ReqCatanSet);
            this.add(1284, ResCatanSet);
            this.add(1287, ReqCatanRoundCommonStart);
            this.add(1289, ReqCatanRoundCommonEnd);
            this.add(1288, ResCatanRoundCommonEnd);
            this.add(1291, ReqCatanBuildRoad);
            this.add(1290, ResCatanBuildRoad);
            this.add(1293, ReqCatanBuildCountry);
            this.add(1292, ResCatanBuildCountry);
            this.add(1295, ReqCatanBuildCity);
            this.add(1294, ResCatanBuildCity);
            this.add(1297, ReqCatanBuildDevelopmentCard);
            this.add(1296, ResCatanBuildDevelopmentCard);
            this.add(1299, ReqCatanTradeSystem);
            this.add(1298, ResCatanTradeSystem);
            this.add(1301, ReqCatanTradeOffer);
            this.add(1300, ResCatanTradeOffer);
            this.add(1303, ReqCatanTradeCounterOffer);
            this.add(1302, ResCatanTradeCounterOffer);
            this.add(1305, ReqCatanTradeCounterOfferToMe);
            this.add(1307, ReqCatanTradeCounterOfferRefuse);
            this.add(1306, ResCatanTradeCounterOfferRefuse);
            this.add(1309, ReqCatanTradeCounterOfferRefuseToMe);
            this.add(1311, ReqCatanTradeDeal);
            this.add(1310, ResCatanTradeDeal);
            this.add(1313, ReqCatanTradeCancel);
            this.add(1312, ResCatanTradeCancel);
            this.add(1315, ReqCatanRob);
            this.add(1314, ResCatanRob);
            this.add(1317, ReqCatanRichCard);
            this.add(1316, ResCatanRichCard);
            this.add(1319, ReqCatanRoadCard);
            this.add(1318, ResCatanRoadCard);
            this.add(1321, ReqCatanKnightCard);
            this.add(1320, ResCatanKnightCard);
            this.add(1323, ReqCatanMonopolyCard);
            this.add(1322, ResCatanMonopolyCard);
            this.add(1325, ReqCatanRoundFoldStart);
            this.add(1327, ReqCatanFold);
            this.add(1326, ResCatanFold);
            this.add(1329, ReqCatanDone);
        }
    }

}