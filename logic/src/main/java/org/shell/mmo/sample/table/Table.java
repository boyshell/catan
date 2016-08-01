package org.shell.mmo.sample.table;

import org.shell.mmo.sample.catan.Catan;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/7/30.
 */
public class Table {
    final int id;
    final String name;
    final String pwd;
    final int map;
    final int max;
    final int min;
    Map<Long, TableRole> masters = new HashMap<>();
    Catan catan;
    boolean start;

    Table(int id, String name, String pwd, int map, int max, int min) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.map = map;
        this.max = max;
        this.min = min;
    }

    static class TableRole {
        final long id;
        final String name;
        boolean ready = false;

        public TableRole(long id, String name) {
            this.id = id;
            this.name = name;
        }
    }
}
