package org.shell.mmo.sample.config.bean {

    import org.shell.mmo.sample.config.proto.*;
    import org.shell.mmo.sample.config.bean.*;
    import flash.utils.Dictionary;

    /**
     * 卡坦岛地图
     * do not edit
     */
    public class CcatanMap {
        private var _id:int; // 地图id
        private var _name:String; // 地图名称
        private var _min:int; // 最小参与人数
        private var _max:int; // 最大参与人数
        private var _grid:Dictionary; // 格子列表
        private var _number:Array; // 数字列表
        private var _brick:int; // 砖头格子数量
        private var _lumber:int; // 木材格子数量
        private var _wool:int; // 羊毛格子数量
        private var _gain:int; // 小麦格子数量
        private var _ore:int; // 煤矿格子数量
        private var _brickPort:int; // 砖头港口数量
        private var _lumberPort:int; // 木材港口数量
        private var _woolPort:int; // 羊毛港口数量
        private var _gainPort:int; // 小麦港口数量
        private var _orePort:int; // 煤矿港口数量
        private var _bankPort:int; // 3比1港口
        private var _brickMax:int; // 砖头上限
        private var _lumberMax:int; // 木材上限
        private var _woolMax:int; // 羊毛上限
        private var _gainMax:int; // 小麦上限
        private var _oreMax:int; // 煤矿上限
        private var _knightMax:int; // 骑士卡上限
        private var _monopolyMax:int; // 垄断卡上限
        private var _richMax:int; // 丰收卡上限
        private var _roadMax:int; // 道路卡上限
        private var _pointMax:int; // 胜利点上限

        public function CcatanMap(pBean:org.shell.mmo.sample.config.proto.CcatanMap) {
            this._id = pBean.id;
            this._name = pBean.name;
            this._min = pBean.min;
            this._max = pBean.max;
            this._grid = new Dictionary();
            for each(var pBean5:org.shell.mmo.sample.config.proto.DcatanGrid in pBean.grid) {
                var bean5:org.shell.mmo.sample.config.bean.DcatanGrid = new org.shell.mmo.sample.config.bean.DcatanGrid(pBean5);
                this._grid[bean5.id] = bean5;
            }
            this._number = new Array(pBean.number);
            this._brick = pBean.brick;
            this._lumber = pBean.lumber;
            this._wool = pBean.wool;
            this._gain = pBean.gain;
            this._ore = pBean.ore;
            this._brickPort = pBean.brickPort;
            this._lumberPort = pBean.lumberPort;
            this._woolPort = pBean.woolPort;
            this._gainPort = pBean.gainPort;
            this._orePort = pBean.orePort;
            this._bankPort = pBean.bankPort;
            this._brickMax = pBean.brickMax;
            this._lumberMax = pBean.lumberMax;
            this._woolMax = pBean.woolMax;
            this._gainMax = pBean.gainMax;
            this._oreMax = pBean.oreMax;
            this._knightMax = pBean.knightMax;
            this._monopolyMax = pBean.monopolyMax;
            this._richMax = pBean.richMax;
            this._roadMax = pBean.roadMax;
            this._pointMax = pBean.pointMax;
        }

        /**
         * 地图id
         */
        public function get id(): int {
            return _id;
        }

        /**
         * 地图名称
         */
        public function get name(): String {
            return _name;
        }

        /**
         * 最小参与人数
         */
        public function get min(): int {
            return _min;
        }

        /**
         * 最大参与人数
         */
        public function get max(): int {
            return _max;
        }

        /**
         * 格子列表
         */
        public function get grid(): Dictionary {
            return _grid;
        }

        /**
         * 数字列表
         */
        public function get number(): Array {
            return _number;
        }

        /**
         * 砖头格子数量
         */
        public function get brick(): int {
            return _brick;
        }

        /**
         * 木材格子数量
         */
        public function get lumber(): int {
            return _lumber;
        }

        /**
         * 羊毛格子数量
         */
        public function get wool(): int {
            return _wool;
        }

        /**
         * 小麦格子数量
         */
        public function get gain(): int {
            return _gain;
        }

        /**
         * 煤矿格子数量
         */
        public function get ore(): int {
            return _ore;
        }

        /**
         * 砖头港口数量
         */
        public function get brickPort(): int {
            return _brickPort;
        }

        /**
         * 木材港口数量
         */
        public function get lumberPort(): int {
            return _lumberPort;
        }

        /**
         * 羊毛港口数量
         */
        public function get woolPort(): int {
            return _woolPort;
        }

        /**
         * 小麦港口数量
         */
        public function get gainPort(): int {
            return _gainPort;
        }

        /**
         * 煤矿港口数量
         */
        public function get orePort(): int {
            return _orePort;
        }

        /**
         * 3比1港口
         */
        public function get bankPort(): int {
            return _bankPort;
        }

        /**
         * 砖头上限
         */
        public function get brickMax(): int {
            return _brickMax;
        }

        /**
         * 木材上限
         */
        public function get lumberMax(): int {
            return _lumberMax;
        }

        /**
         * 羊毛上限
         */
        public function get woolMax(): int {
            return _woolMax;
        }

        /**
         * 小麦上限
         */
        public function get gainMax(): int {
            return _gainMax;
        }

        /**
         * 煤矿上限
         */
        public function get oreMax(): int {
            return _oreMax;
        }

        /**
         * 骑士卡上限
         */
        public function get knightMax(): int {
            return _knightMax;
        }

        /**
         * 垄断卡上限
         */
        public function get monopolyMax(): int {
            return _monopolyMax;
        }

        /**
         * 丰收卡上限
         */
        public function get richMax(): int {
            return _richMax;
        }

        /**
         * 道路卡上限
         */
        public function get roadMax(): int {
            return _roadMax;
        }

        /**
         * 胜利点上限
         */
        public function get pointMax(): int {
            return _pointMax;
        }

    }
}