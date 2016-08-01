package org.shell.mmo.sample.room;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.protobuf.MessageLiteOrBuilder;
import com.shell.mmo.utils.thread.DisruptorWorker;
import com.shell.mmo.utils.thread.Worker;
import org.shell.mmo.sample.account.Account;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.account.RoleLoginEvent;
import org.shell.mmo.sample.event.EventBus;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.Table;
import org.shell.mmo.sample.table.TableService;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/7/30.
 */
@Singleton
public class RoomService {
    private final Map<Integer, Room> rooms;
    private final Worker worker;

    @Inject
    AccountService accountService;
    @Inject
    TableService tableService;

    @Inject
    public RoomService(EventBus eventBus) throws Exception {
        worker = new DisruptorWorker("room-worker", 16 * 1024, 1, Thread.MAX_PRIORITY);
        rooms = new HashMap<>();
        for (int i = 0; i < 5; ++i) {
            rooms.put(i, new Room(i, "catan-" + (i + 1), 500, Global.RoomType.ROOM_CATAN));
        }
        eventBus.register(new EventBus.Handler<RoleLoginEvent>() {
            @Override
            protected void exec(RoleLoginEvent event) {
                worker.execute(() -> onLogin(event.getAccount()));
            }
        });
    }

    public void onLogin(Account account) {
        LogicClient.ReqRoomAll.Builder msg = LogicClient.ReqRoomAll.newBuilder();
        for (Room room : rooms.values()) {
            msg.addRoom(build(room));
        }
        accountService.write(account, msg);
    }

    private Global.GameRoom.Builder build(Room room) {
        Global.GameRoom.Builder builder = Global.GameRoom.newBuilder();
        builder.setId(room.id);
        builder.setName(room.name);
        builder.setMax(room.max);
        builder.setCount(room.roles.size());
        return builder;
    }

    public Room getRoom(int id) {
        return rooms.get(id);
    }

    public void add(Room room, Table table) {
        room.tables.put(tableService.id(table), table);
        write(room, LogicClient.ReqTableAdd.newBuilder().setTable(tableService.build(table)));
    }

    public void add(Room room, Account account) {
        int count = room.roles.size();
        room.roles.add(account.getId());
        account.getRole().getRoom().setId(room.id);
        if (room.roles.size() != count) {
            accountService.write(LogicClient.ReqRoomUpdate.newBuilder().setId(room.id).setCount(room.roles.size()));
        }

        // 告知自己
        LogicClient.ResRoomEnter.Builder msg = LogicClient.ResRoomEnter.newBuilder().setId(room.id);
        for (Table table : room.tables.values()) {
            msg.addTable(tableService.build(table));
        }
        accountService.write(account, msg);
    }

    public void write(Room room, MessageLiteOrBuilder msg) {
        for (long accountId : room.roles) {
            accountService.write(accountId, msg);
        }
    }

    public Room getRoom(Account account) {
        return rooms.get(account.getRole().getRoom().getId());
    }

    public void remove(Room room, Account account) {
        account.getRole().getRoom().setId(-1);
        if (room.roles.remove(account.getId())) {
            accountService.write(LogicClient.ReqRoomUpdate.newBuilder().setId(room.id).setCount(room.roles.size()));
        }

        // 告知自己
        accountService.write(account, LogicClient.ResRoomExit.newBuilder());
    }

    public Table getTable(Room room, int table) {
        return room.tables.get(table);
    }

    public Global.RoomType type(Room room) {
        return room.type;
    }

    public int uid(Room room) {
        return room.uid.incrementAndGet();
    }

    public int id(Room room) {
        return room.id;
    }

    public Worker worker() {
        return worker;
    }
}
