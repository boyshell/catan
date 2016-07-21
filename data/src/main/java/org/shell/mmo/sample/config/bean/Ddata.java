package org.shell.mmo.sample.config.bean;

import org.shell.mmo.sample.config.proto.Config;

/**
 * 示例结构
 * do not edit
 */
public class Ddata {
    private final Integer id; // 唯一id,名字可变更,第一列必须保证唯一
    private final String name; // 字符串示例

    public Ddata(Config.Ddata pBean) {
        this.id = pBean.getId();
        this.name = pBean.getName();
    }

    public static void create(org.apache.poi.ss.usermodel.Sheet sheet, com.google.common.collect.Table<String, Object, com.google.protobuf.MessageLite> type2key2data) {
        com.shell.mmo.utils.ExcelUtil.SheetData data = com.shell.mmo.utils.ExcelUtil.build(sheet);

        for (int i = 0; i < data.getCount(); ++i) {
            Config.Ddata.Builder builder = Config.Ddata.newBuilder();
            builder.setId(Integer.parseInt(data.getColumns().get("id").get(i)));
            builder.setName(data.getColumns().get("name").get(i));

            Config.Ddata build = builder.build();
            type2key2data.put("Ddata", build.getId(), build);
        }
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

}