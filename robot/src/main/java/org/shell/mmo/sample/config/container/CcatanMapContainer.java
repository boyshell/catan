package org.shell.mmo.sample.config.container;

import org.shell.mmo.sample.config.bean.CcatanMap;
import org.shell.mmo.sample.config.proto.Config;

/**
 * 卡坦岛地图
 * do not edit
 */
public class CcatanMapContainer {
    private java.util.List<CcatanMap> list;
    private java.util.Map<Integer, CcatanMap> map;

    public java.util.List<CcatanMap> getList() {
        return list;
    }

    public java.util.Map<Integer, CcatanMap> getMap() {
        return map;
    }

    public CcatanMapContainer(java.util.List<Config.CcatanMap> pList) {
        com.google.common.collect.ImmutableList.Builder<CcatanMap> listBuilder = com.google.common.collect.ImmutableList.builder();
        com.google.common.collect.ImmutableMap.Builder<Integer, CcatanMap> mapBuilder = com.google.common.collect.ImmutableMap.builder();

        for (Config.CcatanMap pBean : pList) {
            CcatanMap bean = new CcatanMap(pBean);
            listBuilder.add(bean);
            mapBuilder.put(bean.getId(), bean);
        }

        this.list = listBuilder.build();
        this.map = mapBuilder.build();
    }
}