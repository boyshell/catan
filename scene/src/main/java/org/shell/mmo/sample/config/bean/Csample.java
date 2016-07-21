package org.shell.mmo.sample.config.bean;

import org.shell.mmo.sample.config.proto.Config;

/**
 * 示例配置文件
 * do not edit
 */
public class Csample {
    private final Integer id; // 唯一id,名字可变更,第一列必须保证唯一
    private final String name; // 字符串示例
    private final Ddata data; // 单个引用数据示例
    private final java.util.List<Ddata> list; // 列表示例
    private final java.util.Map<Integer, Ddata> map; // map示例

    public Csample(Config.Csample pBean) {
        this.id = pBean.getId();
        this.name = pBean.getName();
        this.data = new Ddata(pBean.getData());
        com.google.common.collect.ImmutableList.Builder<Ddata> listBuilder4 = com.google.common.collect.ImmutableList.builder();
        for (Config.Ddata pBean4 : pBean.getListList()) {
            Ddata bean4 = new Ddata(pBean4);
            listBuilder4.add(bean4);
        }
        this.list = listBuilder4.build();
        com.google.common.collect.ImmutableMap.Builder<Integer, Ddata> mapBuilder5 = com.google.common.collect.ImmutableMap.builder();
        for (Config.Ddata pBean5 : pBean.getMapList()) {
            Ddata bean5 = new Ddata(pBean5);
            mapBuilder5.put(bean5.getId(), bean5);
        }
        this.map = mapBuilder5.build();
    }

    public static java.util.List<Config.Csample> createBuilders(org.apache.poi.ss.usermodel.Sheet sheet, com.google.common.collect.Table<String, Object, com.google.protobuf.MessageLite> type2key2data) {
        com.shell.mmo.utils.ExcelUtil.SheetData data = com.shell.mmo.utils.ExcelUtil.build(sheet);

        java.util.List<Config.Csample> list = new java.util.ArrayList<>();
        for (int i = 0; i < data.getCount(); ++i) {
            Config.Csample.Builder builder = Config.Csample.newBuilder();
            builder.setId(Integer.parseInt(data.getColumns().get("id").get(i)));
            builder.setName(data.getColumns().get("name").get(i));
            builder.setData((Config.Ddata) type2key2data.get("Ddata", Integer.parseInt(data.getColumns().get("data").get(i))));
            for (String tmp4 : data.getColumns().get("list").get(i).split(",")) {
                builder.addList((Config.Ddata) type2key2data.get("Ddata", Integer.parseInt(tmp4)));
            }
            for (String tmp5 : data.getColumns().get("map").get(i).split(",")) {
                builder.addMap((Config.Ddata) type2key2data.get("Ddata", Integer.parseInt(tmp5)));
            }
            list.add(builder.build());
        }
        return list;
    }

    /**
     * 唯一id,名字可变更,第一列必须保证唯一
     */
    public Integer getId() {
        return this.id;
    }

    /**
     * 字符串示例
     */
    public String getName() {
        return this.name;
    }

    /**
     * 单个引用数据示例
     */
    public Ddata getData() {
        return this.data;
    }

    /**
     * 列表示例
     */
    public java.util.List<Ddata> getList() {
        return this.list;
    }

    /**
     * map示例
     */
    public java.util.Map<Integer, Ddata> getMap() {
        return this.map;
    }

}