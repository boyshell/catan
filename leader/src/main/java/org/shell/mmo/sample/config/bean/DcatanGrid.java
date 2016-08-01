package org.shell.mmo.sample.config.bean;

import org.shell.mmo.sample.config.proto.Config;

/**
 * 卡坦岛格子,边朝下,非顶点朝下
 * do not edit
 */
public class DcatanGrid {
    private final Integer id; // 格子id
    private final Integer x; // 横坐标,屏幕中心点为0,横向邻接格子坐标变更3,右加左减
    private final Integer y; // 纵坐标,屏幕中心点为0,纵向临界变更6,横向邻接变更3,上加下减

    public DcatanGrid(Config.DcatanGrid pBean) {
        this.id = pBean.getId();
        this.x = pBean.getX();
        this.y = pBean.getY();
    }

    public static void create(org.apache.poi.ss.usermodel.Sheet sheet, com.google.common.collect.Table<String, Object, com.google.protobuf.MessageLite> type2key2data) {
        com.shell.mmo.utils.ExcelUtil.SheetData data = com.shell.mmo.utils.ExcelUtil.build(sheet);

        for (int i = 0; i < data.getCount(); ++i) {
            Config.DcatanGrid.Builder builder = Config.DcatanGrid.newBuilder();
            builder.setId(Integer.parseInt(data.getColumns().get("id").get(i)));
            builder.setX(Integer.parseInt(data.getColumns().get("x").get(i)));
            builder.setY(Integer.parseInt(data.getColumns().get("y").get(i)));

            Config.DcatanGrid build = builder.build();
            type2key2data.put("DcatanGrid", build.getId(), build);
        }
    }

    /**
     * 格子id
     */
    public Integer getId() {
        return this.id;
    }

    /**
     * 横坐标,屏幕中心点为0,横向邻接格子坐标变更3,右加左减
     */
    public Integer getX() {
        return this.x;
    }

    /**
     * 纵坐标,屏幕中心点为0,纵向临界变更6,横向邻接变更3,上加下减
     */
    public Integer getY() {
        return this.y;
    }

}