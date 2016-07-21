package org.shell.mmo.sample.config.container;

import org.shell.mmo.sample.config.bean.Csample;
import org.shell.mmo.sample.config.proto.Config;

/**
 * 示例配置文件
 * do not edit
 */
public class CsampleContainer {
    private java.util.List<Csample> list;
    private java.util.Map<Integer, Csample> map;

    public java.util.List<Csample> getList() {
        return list;
    }

    public java.util.Map<Integer, Csample> getMap() {
        return map;
    }

    public CsampleContainer(java.util.List<Config.Csample> pList) {
        com.google.common.collect.ImmutableList.Builder<Csample> listBuilder = com.google.common.collect.ImmutableList.builder();
        com.google.common.collect.ImmutableMap.Builder<Integer, Csample> mapBuilder = com.google.common.collect.ImmutableMap.builder();

        for (Config.Csample pBean : pList) {
            Csample bean = new Csample(pBean);
            listBuilder.add(bean);
            mapBuilder.put(bean.getId(), bean);
        }

        this.list = listBuilder.build();
        this.map = mapBuilder.build();
    }
}