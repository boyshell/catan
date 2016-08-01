package org.shell.mmo.sample.config;

import org.shell.mmo.sample.config.container.*;
import org.shell.mmo.sample.config.proto.Config;

/**
 * do not edit
 */
public class ConfigGroup {
    public CcatanMapContainer catanMapContainer; // 卡坦岛地图    

    public ConfigGroup(Config.ContainerGroup group) {
        load(group);
    }

    public void load(Config.ContainerGroup group) {
        catanMapContainer = new CcatanMapContainer(group.getCatanMapContainerList());        
    }

    public static Config.ContainerGroup create(java.util.Map<String, org.apache.poi.ss.usermodel.Sheet> csheets, java.util.Map<String, org.apache.poi.ss.usermodel.Sheet> dsheets) {
        com.google.common.collect.Table<String, Object, com.google.protobuf.MessageLite> type2key2data = com.google.common.collect.HashBasedTable.create();
        org.shell.mmo.sample.config.bean.DcatanGrid.create(dsheets.get("DcatanGrid"), type2key2data);

        Config.ContainerGroup.Builder builder = Config.ContainerGroup.newBuilder();
        builder.addAllCatanMapContainer(org.shell.mmo.sample.config.bean.CcatanMap.createBuilders(csheets.get("CcatanMap"), type2key2data));

        return builder.build();
    }
}