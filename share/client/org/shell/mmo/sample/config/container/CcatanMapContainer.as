package org.shell.mmo.sample.config.container {

    import org.shell.mmo.sample.config.bean.CcatanMap;
    import org.shell.mmo.sample.config.proto.CcatanMap;
    import flash.utils.Dictionary;

    /**
     * 卡坦岛地图
     * do not edit
     */
    public class CcatanMapContainer {
        private var _list:Array = new Array();
        private var _map:Dictionary = new Dictionary();

        public function get list():Array {
            return _list;
        }

        public function get map():Dictionary {
            return _map;
        }

        public function CcatanMapContainer(pList:Array) {
            for each(var pBean:org.shell.mmo.sample.config.proto.CcatanMap in pList) {
                var bean:org.shell.mmo.sample.config.bean.CcatanMap = new org.shell.mmo.sample.config.bean.CcatanMap(pBean);
                this.list.push(bean);
                this.map[bean.id] = bean;
            }
        }
    }
}