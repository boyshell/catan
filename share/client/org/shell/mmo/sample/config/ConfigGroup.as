package org.shell.mmo.sample.config;

import org.shell.mmo.sample.config.container.*;
import org.shell.mmo.sample.config.proto.Config;

/**
 * do not edit
 */
public class ConfigGroup {
    public CsampleContainer sampleContainer; // 示例配置文件    

    public ConfigGroup(Config.ContainerGroup group) {
        load(group);
    }

    public void load(Config.ContainerGroup group) {
        sampleContainer = new CsampleContainer(group.getSampleContainerList());        
    }

    public static Config.ContainerGroup create(java.util.Map<String, org.apache.poi.ss.usermodel.Sheet> csheets, java.util.Map<String, org.apache.poi.ss.usermodel.Sheet> dsheets) {
        com.google.common.collect.Table<String, Object, com.google.protobuf.MessageLite> type2key2data = com.google.common.collect.HashBasedTable.create();
        org.shell.mmo.sample.config.bean.Ddata.create(dsheets.get("Ddata"), type2key2data);

        Config.ContainerGroup.Builder builder = Config.ContainerGroup.newBuilder();
        builder.addAllSampleContainer(org.shell.mmo.sample.config.bean.Csample.createBuilders(csheets.get("Csample"), type2key2data));

        return builder.build();
    }
}