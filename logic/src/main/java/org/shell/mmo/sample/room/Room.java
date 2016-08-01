package org.shell.mmo.sample.room;

import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.table.Table;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by zhangxiangxi on 16/7/30.
 */
public class Room {
    final int id;
    final String name;
    final int max;
    final Set<Long> roles = new HashSet<>();
    final AtomicInteger uid = new AtomicInteger();
    final Global.RoomType type;
    final Map<Integer, Table> tables = new HashMap<>();

    Room(int id, String name, int max, Global.RoomType type) {
        this.id = id;
        this.name = name;
        this.max = max;
        this.type = type;
    }
}
