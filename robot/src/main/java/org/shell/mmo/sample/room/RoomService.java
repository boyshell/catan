package org.shell.mmo.sample.room;

import com.google.inject.Singleton;
import org.shell.mmo.sample.message.proto.Global;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
@Singleton
public class RoomService {
    private Map<Integer, Room> rooms = new HashMap<>();

    public void add(Room room) {
        rooms.put(room.getId(), room);
    }

    public Room create(Global.GameRoom room) {
        return new Room(room.getId(), room.getName(), room.getMax(), room.getCount());
    }

    public Room getRoom(int id) {
        return rooms.get(id);
    }
}
