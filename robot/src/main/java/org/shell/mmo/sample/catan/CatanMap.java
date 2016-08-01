package org.shell.mmo.sample.catan;

import com.google.common.base.Preconditions;
import com.google.common.collect.HashBasedTable;
import com.google.common.collect.Table;
import org.shell.mmo.sample.message.proto.Global;

import java.util.*;

/**
 * Created by zhangxiangxi on 16/7/29.
 */
public class CatanMap {
    private Table<Integer, Integer, CatanGrid> grids = HashBasedTable.create();
    private Table<Integer, Integer, CatanPoint> points = HashBasedTable.create();
    private Map<CatanEdge.Key, CatanEdge> edges = new HashMap<>();

    public CatanMap(Global.CatanMap map) {
        for (Global.CatanGrid tmp : map.getGridList()) {
            CatanGrid grid = new CatanGrid(tmp.getPosition().getX(), tmp.getPosition().getY(), tmp.hasType() ? tmp.getType() : null);
            grid.number = tmp.getNumber();
            Preconditions.checkArgument((grid.getType() == null && grid.getNumber() == 0)
                    || (grid.getType() != null && grid.getNumber() != 0));
            init(grid);
            grids.put(grid.x, grid.y, grid);
        }
        // 放置港口
        for (Global.CatanPort port : map.getPortList()) {
            CatanEdge edge = edges.get(CatanEdge.key(port.getPosition1(), port.getPosition2()));
            edge.type = port.getType();
        }
        // TODO 城市,村庄,道路
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
            point.resources |= (0x1 << type.getNumber());
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
            gridBuilder.setType(grid.getType());
            if (grid.getNumber() > 0) {
                gridBuilder.setNumber(grid.getNumber());
            }

            builder.addGrid(gridBuilder);
        }
        // 港口
        for (CatanEdge edge : edges.values()) {
            if (edge.getType() != null) {
                Global.CatanPort.Builder portBuilder = Global.CatanPort.newBuilder();
                portBuilder.setPosition1(Global.Position.newBuilder().setX(edge.getPoint1().getX()).setY(edge.getPoint1().getY()));
                portBuilder.setPosition2(Global.Position.newBuilder().setX(edge.getPoint2().getX()).setY(edge.getPoint2().getY()));
                portBuilder.setType(edge.getType());

                builder.addPort(portBuilder);
            }
        }
        // TODO 城市
        // TODO 村庄
        // TODO 道路
        return builder;
    }

    public static class CatanPoint {
        private final int x;
        private final int y;
        private int resources;
        private final Set<CatanEdge> edges = new HashSet<>();

        public CatanPoint(int x, int y) {
            this.x = x;
            this.y = y;
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
        private final CatanPoint point1;
        private final CatanPoint point2;
        private final Set<CatanGrid> grids = new HashSet<>();
        private Global.CatanPortType type;

        public CatanEdge(CatanPoint p1, CatanPoint p2) {
            this.point1 = p1;
            this.point2 = p2;
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

        static Key key(Global.Position p1, Global.Position p2) {
            return new Key(p1.getX(), p1.getY(), p2.getX(), p2.getY());
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
}
