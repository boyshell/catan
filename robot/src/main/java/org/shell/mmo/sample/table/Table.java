package org.shell.mmo.sample.table;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
public class Table {
    private final int id;
    private final String name;
    private final boolean pwd;
    private final int max;
    private final int map;
    private int count;
    private boolean start;

    public Table(int id, String name, boolean pwd, int max, int map, int count, boolean start) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.max = max;
        this.map = map;
        this.count = count;
        this.start = start;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public boolean isPwd() {
        return pwd;
    }

    public int getMax() {
        return max;
    }

    public int getMap() {
        return map;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public boolean isStart() {
        return start;
    }

    public void setStart(boolean start) {
        this.start = start;
    }
}
