package org.shell.mmo.sample.catan;

import com.google.common.collect.HashBasedTable;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import com.google.common.collect.Table;
import com.shell.mmo.utils.RandomUtil;
import org.shell.mmo.sample.config.bean.CcatanMap;
import org.shell.mmo.sample.config.bean.DcatanGrid;
import org.shell.mmo.sample.message.proto.Global;

import java.util.*;

/**
 * Created by zhangxiangxi on 16/7/29.
 */
public class CatanMap {
    private Table<Integer, Integer, CatanGrid> grids = HashBasedTable.create();
    private Table<Integer, Integer, CatanPoint> points = HashBasedTable.create();
    private Map<CatanEdge.Key, CatanEdge> edges = new HashMap<>();
    private CatanRobber robber;
    private Multimap<Integer, CatanGrid> dice2grid = HashMultimap.create();

    public CatanMap(CcatanMap config) {
        // 构造地图
        List<Global.CatanResourceType> ground = new ArrayList<>();
        // TODO 这种是否配置可以支持一下?
        ground.addAll(resources(Global.CatanResourceType.RESOURCE_BRICK, config.getBrick()));
        ground.addAll(resources(Global.CatanResourceType.RESOURCE_LUMBER, config.getLumber()));
        ground.addAll(resources(Global.CatanResourceType.RESOURCE_WOOL, config.getWool()));
        ground.addAll(resources(Global.CatanResourceType.RESOURCE_GAIN, config.getGain()));
        ground.addAll(resources(Global.CatanResourceType.RESOURCE_ORE, config.getOre()));
        ground = RandomUtil.random(ground);
        int desert = config.getGrid().size() - ground.size();

        for (DcatanGrid tmp : config.getGrid().values()) {
            int index = RandomUtil.random(0, desert + ground.size());
            Global.CatanResourceType type = null;
            if (index < ground.size()) {
                type = ground.remove(index);
            } else {
                --desert;
            }
            CatanGrid grid = new CatanGrid(tmp.getX(), tmp.getY(), type);
            init(grid);
            grids.put(grid.x, grid.y, grid);
        }

        // 放置数字
        int number6 = 0;
        int number8 = 0;
        List<Integer> numbers = new ArrayList<>();
        for (int n : config.getNumber()) {
            if (n == 6) {
                ++number6;
            } else if (n == 8) {
                ++number8;
            } else {
                numbers.add(n);
            }
        }
        numbers = RandomUtil.random(numbers);
        List<CatanGrid> allGrids = new ArrayList<>(grids.values());
        RandomUtil.random(allGrids);
        // 先放6,8 不能够相邻
        Iterator<CatanGrid> it = allGrids.iterator();
        while (it.hasNext()) {
            CatanGrid grid = it.next();
            if (number6 <= 0 && number8 <= 0) {
                break;
            }
            if (grid.getType() == null) {
                it.remove();
                continue;
            } else if (roundClear(grid)) {// 选一个周围都没有6,8的grid
                if (number6 > 0) {
                    --number6;
                    grid.number = 6;
                } else if (number8 > 0) {
                    --number8;
                    grid.number = 8;
                }
                dice2grid.put(grid.number, grid);

                it.remove();
                continue;
            }
        }
        for (CatanGrid grid : allGrids) {
            if (grid.type != null) {
                grid.number = numbers.remove(0);
                for (CatanPoint point : grid.getPoints()) {
                    dice2grid.put(grid.number, grid);
                }
            }
        }
        // 放置强盗
        robber = new CatanRobber();
        robber.grid = allGrids.get(allGrids.size() - 1);
        // 放置港口
        List<Global.CatanPortType> ports = new ArrayList<>();
        ports.addAll(ports(Global.CatanPortType.PORT_BRICK, config.getBrickPort()));
        ports.addAll(ports(Global.CatanPortType.PORT_LUMBER, config.getLumberPort()));
        ports.addAll(ports(Global.CatanPortType.PORT_WOOL, config.getWoolPort()));
        ports.addAll(ports(Global.CatanPortType.PORT_GAIN, config.getGainPort()));
        ports.addAll(ports(Global.CatanPortType.PORT_ORE, config.getOrePort()));
        ports.addAll(ports(Global.CatanPortType.PORT_BANK, config.getBankPort()));
        ports = RandomUtil.random(ports);

        List<CatanEdge> edges0 = new ArrayList<>(edges.values());
        edges0 = RandomUtil.random(edges0);
        for (CatanEdge edge : edges0) {
            if (ports.isEmpty()) {
                break;
            }
            if (outsideAndClear(edge)) {
                edge.type = ports.remove(0);
            }
        }
    }

    public Multimap<Integer, CatanGrid> getDice2grid() {
        return dice2grid;
    }

    public CatanRobber getRobber() {
        return robber;
    }

    public Map<CatanEdge.Key, CatanEdge> getEdges() {
        return edges;
    }

    public Table<Integer, Integer, CatanGrid> getGrids() {
        return grids;
    }

    public Table<Integer, Integer, CatanPoint> getPoints() {
        return points;
    }

    private boolean outsideAndClear(CatanEdge edge) {
        if (edge.grids.size() > 1) {
            return false;
        }
        // 相邻的边没有港口
        for (CatanEdge tmp : edge.getPoint1().edges) {
            if (tmp.type != null) {
                return false;
            }
        }
        for (CatanEdge tmp : edge.getPoint2().edges) {
            if (tmp.type != null) {
                return false;
            }
        }
        return true;
    }

    private Collection<? extends Global.CatanPortType> ports(Global.CatanPortType type, int count) {
        List<Global.CatanPortType> list = new ArrayList<>();
        for (int i = 0; i < count; ++i) {
            list.add(type);
        }
        return list;
    }

    private boolean roundClear(CatanGrid grid) {
        for (CatanEdge edge : grid.edges) {
            for (CatanGrid tmp : edge.grids) {
                if (tmp.number > 0) {
                    return false;
                }
            }
        }
        return true;
    }

    private void init(CatanGrid grid) {
        init(grid.x - 1, grid.y - 3, grid.x + 1, grid.y - 3, grid);
        init(grid.x + 1, grid.y - 3, grid.x + 2, grid.y, grid);
        init(grid.x + 2, grid.y, grid.x + 1, grid.y + 3, grid);
        init(grid.x + 1, grid.y + 3, grid.x - 1, grid.y + 3, grid);
        init(grid.x - 1, grid.y + 3, grid.x - 2, grid.y, grid);
        init(grid.x - 2, grid.y, grid.x - 1, grid.y - 3, grid);
    }

    private void init(int x1, int y1, int x2, int y2, CatanGrid grid) {
        CatanPoint p1 = point(x1, y1, grid.type);
        CatanPoint p2 = point(x2, y2, grid.type);
        grid.points.add(p1);
        grid.points.add(p2);

        CatanEdge edge = edge(p1, p2, grid);
        grid.edges.add(edge);
    }

    private CatanEdge edge(CatanPoint p1, CatanPoint p2, CatanGrid grid) {
        CatanEdge edge = edge(p1, p2);
        edge.grids.add(grid);
        return edge;
    }

    private CatanEdge edge(CatanPoint p1, CatanPoint p2) {
        CatanEdge.Key key = CatanEdge.key(p1, p2);
        CatanEdge edge = edges.get(key);
        if (edge == null) {
            edge = new CatanEdge(p1, p2);
            edges.put(key, edge);
        }
        p1.edges.add(edge);
        p2.edges.add(edge);
        return edge;
    }

    private CatanPoint point(int x, int y, Global.CatanResourceType type) {
        CatanPoint point = points.get(x, y);
        if (point == null) {
            point = new CatanPoint(x, y);
            points.put(x, y, point);
        }
        if (type != null) {
            point.resources |= (0x1 << type.ordinal());
        }
        return point;
    }

    private Collection<? extends Global.CatanResourceType> resources(Global.CatanResourceType type, int count) {
        List<Global.CatanResourceType> list = new ArrayList<>();
        for (int i = 0; i < count; ++i) {
            list.add(type);
        }
        return list;
    }

    public Global.CatanMap.Builder build() {
        Global.CatanMap.Builder builder = Global.CatanMap.newBuilder();
        // 格子
        for (CatanGrid grid : grids.values()) {
            Global.CatanGrid.Builder gridBuilder = Global.CatanGrid.newBuilder();
            gridBuilder.setPosition(Global.Position.newBuilder().setX(grid.getX()).setY(grid.getY()));
            if (grid.getNumber() > 0) {
                gridBuilder.setNumber(grid.getNumber());
                gridBuilder.setType(grid.getType());
            }

            builder.addGrid(gridBuilder);
        }
        for (CatanEdge edge : edges.values()) {
            // 港口
            if (edge.getType() != null) {
                Global.CatanPort.Builder portBuilder = Global.CatanPort.newBuilder();
                portBuilder.setPosition1(Global.Position.newBuilder().setX(edge.getPoint1().getX()).setY(edge.getPoint1().getY()));
                portBuilder.setPosition2(Global.Position.newBuilder().setX(edge.getPoint2().getX()).setY(edge.getPoint2().getY()));
                portBuilder.setType(edge.getType());

                builder.addPort(portBuilder);
            }
            // 道路
            if (edge.owner != 0) {
                builder.addRoad(Global.CatanRoad.newBuilder()
                        .setId(edge.owner)
                        .setPoint1(Global.Position.newBuilder().setX(edge.getPoint1().getX()).setY(edge.getPoint1().getY()))
                        .setPoint2(Global.Position.newBuilder().setX(edge.getPoint2().getX()).setY(edge.getPoint2().getY())));
            }
        }
        // 强盗
        builder.setRobber(Global.Position.newBuilder().setX(robber.grid.getX()).setY(robber.grid.getY()));
        for (CatanPoint point : points.values()) {
            if (point.buildingType == BuildingType.COUNTRY) { // 村庄
                builder.addCountry(Global.CatanCountry.newBuilder().setId(point.getOwner()).setPoint(Global.Position.newBuilder().setX(point.getX()).setY(point.getY())));
            } else if (point.buildingType == BuildingType.CITY) { // 城市
                builder.addCity(Global.CatanCity.newBuilder().setId(point.getOwner()).setPoint(Global.Position.newBuilder().setX(point.getX()).setY(point.getY())));
            }
        }

        return builder;
    }

    public enum BuildingType {
        COUNTRY(Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_LUMBER).setNum(1).build()
                , Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_BRICK).setNum(1).build()
                , Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_WOOL).setNum(1).build()
                , Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_GAIN).setNum(1).build()),
        CITY(Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_GAIN).setNum(2).build()
                , Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_ORE).setNum(3).build()),
        ROAD(Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_LUMBER).setNum(1).build()
                , Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_BRICK).setNum(1).build()),
        CARD(Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_WOOL).setNum(1).build()
                , Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_GAIN).setNum(1).build()
                , Global.CatanResource.newBuilder().setType(Global.CatanResourceType.RESOURCE_ORE).setNum(1).build())
        ;
        private final List<Global.CatanResource> cost;

        BuildingType(Global.CatanResource... cost) {
            this.cost = new ArrayList<>();
            for (Global.CatanResource r : cost) {
                this.cost.add(r);
            }
        }

        public List<Global.CatanResource> getCost() {
            return cost;
        }
    }

    public static class CatanPoint {
        final int x;
        final int y;
        int resources;
        final Set<CatanEdge> edges = new HashSet<>();
        BuildingType buildingType;
        long owner;


        public CatanPoint(int x, int y) {
            this.x = x;
            this.y = y;
        }

        public Set<CatanEdge> getEdges() {
            return edges;
        }

        public BuildingType getBuildingType() {
            return buildingType;
        }

        public long getOwner() {
            return owner;
        }

        public int getX() {
            return x;
        }

        public int getY() {
            return y;
        }

        public int getResources() {
            return resources;
        }

        public boolean isSet(Global.CatanResourceType type) {
            return (resources & (0x1 << type.ordinal())) != 0;
        }
    }

    public static class CatanGrid {
        private final int x;
        private final int y;
        private final Global.CatanResourceType type;
        private final Set<CatanPoint> points = new HashSet<>(); // 6个顶点
        private final Set<CatanEdge> edges = new HashSet<>(); // 6条边
        private int number;

        public CatanGrid(int x, int y, Global.CatanResourceType type) {
            this.x = x;
            this.y = y;
            this.type = type;
        }

        public Set<CatanPoint> getPoints() {
            return points;
        }

        public int getX() {
            return x;
        }

        public int getY() {
            return y;
        }

        public Global.CatanResourceType getType() {
            return type;
        }

        public int getNumber() {
            return number;
        }
    }

    public static class CatanEdge {
        final CatanPoint point1;
        final CatanPoint point2;
        final Set<CatanGrid> grids = new HashSet<>();
        Global.CatanPortType type;
        long owner;

        public CatanEdge(CatanPoint p1, CatanPoint p2) {
            this.point1 = p1;
            this.point2 = p2;
        }

        public void setOwner(long owner) {
            this.owner = owner;
        }

        public long getOwner() {
            return owner;
        }

        public CatanPoint getPoint1() {
            return point1;
        }

        public CatanPoint getPoint2() {
            return point2;
        }

        public Global.CatanPortType getType() {
            return type;
        }

        public Set<CatanGrid> getGrids() {
            return grids;
        }

        static Key key(CatanPoint p1, CatanPoint p2) {
            return new Key(p1.x, p1.y, p2.x, p2.y);
        }

        public static class Key {
            private final int x1;
            private final int y1;
            private final int x2;
            private final int y2;

            @Override
            public boolean equals(Object o) {
                if (this == o) return true;
                if (o == null || getClass() != o.getClass()) return false;

                Key key = (Key) o;
                if ((x1 == key.x1 && x2 == key.x2 && y1 == key.y1 && y2 == key.y2)
                        || (x1 == key.x2 && x2 == key.x1 && y1 == key.y2 && y2 == key.y1)) {
                    return true;
                }
                return false;
            }

            @Override
            public int hashCode() {
                return x1 + x2 + y1 + y2;
            }

            public Key(int x1, int y1, int x2, int y2) {
                this.x1 = x1;
                this.y1 = y1;
                this.x2 = x2;
                this.y2 = y2;
            }
        }
    }

    public static class CatanRobber {
        CatanGrid grid;
    }
}
