package org.shell.mmo.sample.room;

import org.shell.mmo.sample.table.Table;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
public class Room {
    private final int id;
    private final String name;
    private final int max;
    private int count;
    private Map<Integer, Table> tables = new HashMap<>();

    public Room(int id, String name, int max, int count) {
        this.id = id;
        this.name = name;
        this.max = max;
        this.count = count;
    }

    public Map<Integer, Table> getTables() {
        return tables;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getMax() {
        return max;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
