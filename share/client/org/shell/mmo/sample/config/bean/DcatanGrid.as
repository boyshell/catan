package org.shell.mmo.sample.config.bean {

    import org.shell.mmo.sample.config.proto.*;
    import org.shell.mmo.sample.config.bean.*;
    import flash.utils.Dictionary;

    /**
     * 卡坦岛格子,边朝下,非顶点朝下
     * do not edit
     */
    public class DcatanGrid {
        private var _id:int; // 格子id
        private var _x:int; // 横坐标,屏幕中心点为0,横向邻接格子坐标变更3,右加左减
        private var _y:int; // 纵坐标,屏幕中心点为0,纵向临界变更6,横向邻接变更3,上加下减

        public function DcatanGrid(pBean:org.shell.mmo.sample.config.proto.DcatanGrid) {
            this._id = pBean.id;
            this._x = pBean.x;
            this._y = pBean.y;
        }

        /**
         * 格子id
         */
        public function get id(): int {
            return _id;
        }

        /**
         * 横坐标,屏幕中心点为0,横向邻接格子坐标变更3,右加左减
         */
        public function get x(): int {
            return _x;
        }

        /**
         * 纵坐标,屏幕中心点为0,纵向临界变更6,横向邻接变更3,上加下减
         */
        public function get y(): int {
            return _y;
        }

    }
}