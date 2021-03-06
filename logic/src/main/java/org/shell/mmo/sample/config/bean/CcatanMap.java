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
    private final Integer brickMax; // 砖头上限
    private final Integer lumberMax; // 木材上限
    private final Integer woolMax; // 羊毛上限
    private final Integer gainMax; // 小麦上限
    private final Integer oreMax; // 煤矿上限
    private final Integer knightMax; // 骑士卡上限
    private final Integer monopolyMax; // 垄断卡上限
    private final Integer richMax; // 丰收卡上限
    private final Integer roadMax; // 道路卡上限
    private final Integer pointMax; // 胜利点上限

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
        this.grid = gridBuilder5.build();
        com.google.common.collect.ImmutableList.Builder<Integer> numberBuilder6 = com.google.common.collect.ImmutableList.builder();
        numberBuilder6.addAll(pBean.getNumberList());
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
        this.brickMax = pBean.getBrickMax();
        this.lumberMax = pBean.getLumberMax();
        this.woolMax = pBean.getWoolMax();
        this.gainMax = pBean.getGainMax();
        this.oreMax = pBean.getOreMax();
        this.knightMax = pBean.getKnightMax();
        this.monopolyMax = pBean.getMonopolyMax();
        this.richMax = pBean.getRichMax();
        this.roadMax = pBean.getRoadMax();
        this.pointMax = pBean.getPointMax();
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
                builder.addNumber(Integer.parseInt(tmp6));
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
            builder.setBrickMax(Integer.parseInt(data.getColumns().get("brickMax").get(i)));
            builder.setLumberMax(Integer.parseInt(data.getColumns().get("lumberMax").get(i)));
            builder.setWoolMax(Integer.parseInt(data.getColumns().get("woolMax").get(i)));
            builder.setGainMax(Integer.parseInt(data.getColumns().get("gainMax").get(i)));
            builder.setOreMax(Integer.parseInt(data.getColumns().get("oreMax").get(i)));
            builder.setKnightMax(Integer.parseInt(data.getColumns().get("knightMax").get(i)));
            builder.setMonopolyMax(Integer.parseInt(data.getColumns().get("monopolyMax").get(i)));
            builder.setRichMax(Integer.parseInt(data.getColumns().get("richMax").get(i)));
            builder.setRoadMax(Integer.parseInt(data.getColumns().get("roadMax").get(i)));
            builder.setPointMax(Integer.parseInt(data.getColumns().get("pointMax").get(i)));
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

    /**
     * 砖头上限
     */
    public Integer getBrickMax() {
        return this.brickMax;
    }

    /**
     * 木材上限
     */
    public Integer getLumberMax() {
        return this.lumberMax;
    }

    /**
     * 羊毛上限
     */
    public Integer getWoolMax() {
        return this.woolMax;
    }

    /**
     * 小麦上限
     */
    public Integer getGainMax() {
        return this.gainMax;
    }

    /**
     * 煤矿上限
     */
    public Integer getOreMax() {
        return this.oreMax;
    }

    /**
     * 骑士卡上限
     */
    public Integer getKnightMax() {
        return this.knightMax;
    }

    /**
     * 垄断卡上限
     */
    public Integer getMonopolyMax() {
        return this.monopolyMax;
    }

    /**
     * 丰收卡上限
     */
    public Integer getRichMax() {
        return this.richMax;
    }

    /**
     * 道路卡上限
     */
    public Integer getRoadMax() {
        return this.roadMax;
    }

    /**
     * 胜利点上限
     */
    public Integer getPointMax() {
        return this.pointMax;
    }

}