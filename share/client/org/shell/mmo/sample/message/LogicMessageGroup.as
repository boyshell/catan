package org.shell.mmo.sample.message {

    import org.shell.mmo.sample.message.proto.ReqLoginLogin;
    import org.shell.mmo.sample.message.proto.ResLoginLogin;
    import org.shell.mmo.sample.message.proto.ReqLoginReplace;
    import org.shell.mmo.sample.message.proto.ReqRoleCreateRole;
    import org.shell.mmo.sample.message.proto.ResRoleCreateRole;
    import org.shell.mmo.sample.message.proto.ReqRoomEnter;
    import org.shell.mmo.sample.message.proto.ResRoomEnter;
    import org.shell.mmo.sample.message.proto.ReqRoomExit;
    import org.shell.mmo.sample.message.proto.ResRoomExit;
    import org.shell.mmo.sample.message.proto.ReqRoomAll;
    import org.shell.mmo.sample.message.proto.ReqRoomUpdate;
    import org.shell.mmo.sample.message.proto.ReqTableCreate;
    import org.shell.mmo.sample.message.proto.ResTableCreate;
    import org.shell.mmo.sample.message.proto.ReqTableAdd;
    import org.shell.mmo.sample.message.proto.ReqTableJoin;
    import org.shell.mmo.sample.message.proto.ResTableJoin;
    import org.shell.mmo.sample.message.proto.ReqTableUpdate;
    import org.shell.mmo.sample.message.proto.ReqTableExit;
    import org.shell.mmo.sample.message.proto.ResTableExit;
    import org.shell.mmo.sample.message.proto.ReqTableRemove;
    import org.shell.mmo.sample.message.proto.ReqTableReady;
    import org.shell.mmo.sample.message.proto.ResTableReady;
    import org.shell.mmo.sample.message.proto.ReqCatanStart;
    import org.shell.mmo.sample.message.proto.ReqCatanRoundInitStart;
    import org.shell.mmo.sample.message.proto.ReqCatanSet;
    import org.shell.mmo.sample.message.proto.ResCatanSet;
    import org.shell.mmo.sample.message.proto.ReqCatanRoundCommonStart;
    import org.shell.mmo.sample.message.proto.ReqCatanRoundCommonEnd;
    import org.shell.mmo.sample.message.proto.ResCatanRoundCommonEnd;
    import org.shell.mmo.sample.message.proto.ReqCatanBuildRoad;
    import org.shell.mmo.sample.message.proto.ResCatanBuildRoad;
    import org.shell.mmo.sample.message.proto.ReqCatanBuildCountry;
    import org.shell.mmo.sample.message.proto.ResCatanBuildCountry;
    import org.shell.mmo.sample.message.proto.ReqCatanBuildCity;
    import org.shell.mmo.sample.message.proto.ResCatanBuildCity;
    import org.shell.mmo.sample.message.proto.ReqCatanBuildDevelopmentCard;
    import org.shell.mmo.sample.message.proto.ResCatanBuildDevelopmentCard;
    import org.shell.mmo.sample.message.proto.ReqCatanTradeSystem;
    import org.shell.mmo.sample.message.proto.ResCatanTradeSystem;
    import org.shell.mmo.sample.message.proto.ReqCatanTradeOffer;
    import org.shell.mmo.sample.message.proto.ResCatanTradeOffer;
    import org.shell.mmo.sample.message.proto.ReqCatanTradeCounterOffer;
    import org.shell.mmo.sample.message.proto.ResCatanTradeCounterOffer;
    import org.shell.mmo.sample.message.proto.ReqCatanTradeCounterOfferToMe;
    import org.shell.mmo.sample.message.proto.ReqCatanTradeCounterOfferRefuse;
    import org.shell.mmo.sample.message.proto.ResCatanTradeCounterOfferRefuse;
    import org.shell.mmo.sample.message.proto.ReqCatanTradeCounterOfferRefuseToMe;
    import org.shell.mmo.sample.message.proto.ReqCatanTradeDeal;
    import org.shell.mmo.sample.message.proto.ResCatanTradeDeal;
    import org.shell.mmo.sample.message.proto.ReqCatanTradeCancel;
    import org.shell.mmo.sample.message.proto.ResCatanTradeCancel;
    import org.shell.mmo.sample.message.proto.ReqCatanRob;
    import org.shell.mmo.sample.message.proto.ResCatanRob;
    import org.shell.mmo.sample.message.proto.ReqCatanRichCard;
    import org.shell.mmo.sample.message.proto.ResCatanRichCard;
    import org.shell.mmo.sample.message.proto.ReqCatanRoadCard;
    import org.shell.mmo.sample.message.proto.ResCatanRoadCard;
    import org.shell.mmo.sample.message.proto.ReqCatanKnightCard;
    import org.shell.mmo.sample.message.proto.ResCatanKnightCard;
    import org.shell.mmo.sample.message.proto.ReqCatanMonopolyCard;
    import org.shell.mmo.sample.message.proto.ResCatanMonopolyCard;
    import org.shell.mmo.sample.message.proto.ReqCatanRoundFoldStart;
    import org.shell.mmo.sample.message.proto.ReqCatanFold;
    import org.shell.mmo.sample.message.proto.ResCatanFold;
    import org.shell.mmo.sample.message.proto.ReqCatanDone;

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