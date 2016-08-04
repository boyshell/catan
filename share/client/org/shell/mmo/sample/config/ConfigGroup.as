package org.shell.mmo.sample.config {

    import org.shell.mmo.sample.config.container.*;
    import org.shell.mmo.sample.config.proto.ContainerGroup;

    /**
     * do not edit
     */
    public class ConfigGroup {
        private var _catanMapContainer:CcatanMapContainer; // 卡坦岛地图

        public function ConfigGroup(group:ContainerGroup) {
            load(group);
        }

        public function load(group:ContainerGroup): void {
            this._catanMapContainer = new CcatanMapContainer(group.getCatanMapContainerList());
        }

        // 卡坦岛地图
        public function get catanMapContainer():CcatanMapContainer {
            return _catanMapContainer;
        }
    }
}