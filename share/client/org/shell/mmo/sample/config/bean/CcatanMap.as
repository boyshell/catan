package org.shell.mmo.sample.config.bean;

import org.shell.mmo.sample.config.proto.Config;

/**
 * 卡坦岛地图
 * do not edit
 */
public class CcatanMap {
    private final Integer id; // 地图id
    private final String name; // 地图名称
    private final Integer min; // 最小参与人数
    private final Integer max; // 最大参与人数
    private final java.util.Map<Integer, DcatanGrid> grid; // 格子列表
    private final java.util.List<Integer> number; // 数字列表
    private final Integer brick; // 砖头格子数量
    private final Integer lumber; // 木材格子数量
    private final Integer wool; // 羊毛格子数量
    private final Integer gain; // 小麦格子数量
    private final Integer ore; // 煤矿格子数量
    private final Integer brickPort; // 砖头港口数量
    private final Integer lumberPort; // 木材港口数量
    private final Integer woolPort; // 羊毛港口数量
    private final Integer gainPort; // 小麦港口数量
    private final Integer orePort; // 煤矿港口数量
    private final Integer bankPort; // 3比1港口

    public CcatanMap(Config.CcatanMap pBean) {
        this.id = pBean.getId();
        this.name = pBean.getName();
        this.min = pBean.getMin();
        this.max = pBean.getMax();
        com.google.common.collect.ImmutableMap.Builder<Integer, DcatanGrid> gridBuilder5 = com.google.common.collect.ImmutableMap.builder();
        for (Config.DcatanGrid pBean5 : pBean.getGridList()) {
            DcatanGrid bean5 = new DcatanGrid(pBean5);
            gridBuilder5.put(bean5.getId(), bean5);
        }
        this.map = gridBuilder5.build();
        com.google.common.collect.ImmutableList.Builder<int32> numberBuilder6 = com.google.common.collect.ImmutableList.builder();
        for (Config.int32 pBean6 : pBean.getNumberList()) {
            int32 bean6 = new int32(pBean6);
            numberBuilder6.add(bean6);
        }
        this.number = numberBuilder6.build();
        this.brick = pBean.getBrick();
        this.lumber = pBean.getLumber();
        this.wool = pBean.getWool();
        this.gain = pBean.getGain();
        this.ore = pBean.getOre();
        this.brickPort = pBean.getBrickPort();
        this.lumberPort = pBean.getLumberPort();
        this.woolPort = pBean.getWoolPort();
        this.gainPort = pBean.getGainPort();
        this.orePort = pBean.getOrePort();
        this.bankPort = pBean.getBankPort();
    }

    public static java.util.List<Config.CcatanMap> createBuilders(org.apache.poi.ss.usermodel.Sheet sheet, com.google.common.collect.Table<String, Object, com.google.protobuf.MessageLite> type2key2data) {
        com.shell.mmo.utils.ExcelUtil.SheetData data = com.shell.mmo.utils.ExcelUtil.build(sheet);

        java.util.List<Config.CcatanMap> list = new java.util.ArrayList<>();
        for (int i = 0; i < data.getCount(); ++i) {
            Config.CcatanMap.Builder builder = Config.CcatanMap.newBuilder();
            builder.setId(Integer.parseInt(data.getColumns().get("id").get(i)));
            builder.setName(data.getColumns().get("name").get(i));
            builder.setMin(Integer.parseInt(data.getColumns().get("min").get(i)));
            builder.setMax(Integer.parseInt(data.getColumns().get("max").get(i)));
            for (String tmp5 : data.getColumns().get("grid").get(i).split(",")) {
                builder.addGrid((Config.DcatanGrid) type2key2data.get("DcatanGrid", Integer.parseInt(tmp5)));
            }
            for (String tmp6 : data.getColumns().get("number").get(i).split(",")) {
                builder.addNumber((Config.int32) type2key2data.get("int32", Integer.parseInt(tmp6)));
            }
            builder.setBrick(Integer.parseInt(data.getColumns().get("brick").get(i)));
            builder.setLumber(Integer.parseInt(data.getColumns().get("lumber").get(i)));
            builder.setWool(Integer.parseInt(data.getColumns().get("wool").get(i)));
            builder.setGain(Integer.parseInt(data.getColumns().get("gain").get(i)));
            builder.setOre(Integer.parseInt(data.getColumns().get("ore").get(i)));
            builder.setBrickPort(Integer.parseInt(data.getColumns().get("brickPort").get(i)));
            builder.setLumberPort(Integer.parseInt(data.getColumns().get("lumberPort").get(i)));
            builder.setWoolPort(Integer.parseInt(data.getColumns().get("woolPort").get(i)));
            builder.setGainPort(Integer.parseInt(data.getColumns().get("gainPort").get(i)));
            builder.setOrePort(Integer.parseInt(data.getColumns().get("orePort").get(i)));
            builder.setBankPort(Integer.parseInt(data.getColumns().get("bankPort").get(i)));
            list.add(builder.build());
        }
        return list;
    }

    /**
     * 地图id
     */
    public Integer getId() {
        return this.id;
    }

    /**
     * 地图名称
     */
    public String getName() {
        return this.name;
    }

    /**
     * 最小参与人数
     */
    public Integer getMin() {
        return this.min;
    }

    /**
     * 最大参与人数
     */
    public Integer getMax() {
        return this.max;
    }

    /**
     * 格子列表
     */
    public java.util.Map<Integer, DcatanGrid> getGrid() {
        return this.grid;
    }

    /**
     * 数字列表
     */
    public java.util.List<Integer> getNumber() {
        return this.number;
    }

    /**
     * 砖头格子数量
     */
    public Integer getBrick() {
        return this.brick;
    }

    /**
     * 木材格子数量
     */
    public Integer getLumber() {
        return this.lumber;
    }

    /**
     * 羊毛格子数量
     */
    public Integer getWool() {
        return this.wool;
    }

    /**
     * 小麦格子数量
     */
    public Integer getGain() {
        return this.gain;
    }

    /**
     * 煤矿格子数量
     */
    public Integer getOre() {
        return this.ore;
    }

    /**
     * 砖头港口数量
     */
    public Integer getBrickPort() {
        return this.brickPort;
    }

    /**
     * 木材港口数量
     */
    public Integer getLumberPort() {
        return this.lumberPort;
    }

    /**
     * 羊毛港口数量
     */
    public Integer getWoolPort() {
        return this.woolPort;
    }

    /**
     * 小麦港口数量
     */
    public Integer getGainPort() {
        return this.gainPort;
    }

    /**
     * 煤矿港口数量
     */
    public Integer getOrePort() {
        return this.orePort;
    }

    /**
     * 3比1港口
     */
    public Integer getBankPort() {
        return this.bankPort;
    }

}