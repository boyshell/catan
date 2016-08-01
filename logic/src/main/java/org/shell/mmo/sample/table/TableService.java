package org.shell.mmo.sample.table;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.protobuf.MessageLiteOrBuilder;
import com.shell.mmo.utils.HashUtil;
import com.shell.mmo.utils.thread.DisruptorWorker;
import com.shell.mmo.utils.thread.Worker;
import org.shell.mmo.sample.account.Account;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.room.Room;
import org.shell.mmo.sample.room.RoomService;

import java.util.Map;

/**
 * Created by zhangxiangxi on 16/7/30.
 */
@Singleton
public class TableService {
    private final Worker[] workers;

    public TableService() throws Exception {
        this.workers = DisruptorWorker.createGroup("table-worker", 16 * 1024, Thread.MAX_PRIORITY, Runtime.getRuntime().availableProcessors());
        for (int i = 0; i < this.workers.length; ++i) {
            ((DisruptorWorker)this.workers[i]).setKey(i);
        }
    }

    @Inject
    RoomService roomService;
    @Inject
    AccountService accountService;
    @Inject
    CatanService catanService;

    public Global.GameTable.Builder build(Table table) {
        Global.GameTable.Builder builder = Global.GameTable.newBuilder();
        builder.setId(table.id);
        builder.setCount(table.masters.size());
        builder.setName(table.name);
        builder.setStart(table.start);
        builder.setPwd(table.pwd != null);
        builder.setMax(table.max);
        return builder;
    }

    public Global.TableRole.Builder build(Table.TableRole role) {
        Global.TableRole.Builder builder = Global.TableRole.newBuilder();
        builder.setId(role.id);
        builder.setName(role.name);
        builder.setReady(role.ready);
        return builder;
    }

    public Table getTable(Room room, Account account) {
        return getTable(room, account.getRole().getRoom().getTable());
    }

    public void add(Room room, Table table, Account account) {
        // 把自己添加到table里面
        Table.TableRole tableRole = new Table.TableRole(account.getId(), account.getRole().getName());
        table.masters.put(tableRole.id, tableRole);
        account.getRole().getRoom().setTable(table.id);

        LogicClient.ResTableJoin.Builder self = LogicClient.ResTableJoin.newBuilder().setId(table.id).setMap(table.map).addMaster(build(tableRole));
        LogicClient.ResTableJoin.Builder other = LogicClient.ResTableJoin.newBuilder().setId(table.id).setMap(table.map);
        table.masters.values().stream().filter(role -> role.id != account.getId()).forEach(role -> {
            accountService.write(role.id, self);
            other.addMaster(build(role));
        });
        if (other.getMasterCount() > 0) {
            accountService.write(account, other);
        }
        // 告知room的所有人,人数变更
        roomService.write(room, LogicClient.ReqTableUpdate.newBuilder().setId(table.id).setCount(count(table)));
    }

    public void remove(Room room, Table table, Account account) {
        write(table, LogicClient.ResTableExit.newBuilder().setId(account.getId()));
        table.masters.remove(account.getId());
        roomService.write(room, LogicClient.ReqTableUpdate.newBuilder().setId(table.id).setCount(count(table)));
    }

    public void write(Table table, MessageLiteOrBuilder msg) {
        for (long id : table.masters.keySet()) {
            accountService.write(id, msg);
        }
    }

    public Table.TableRole getTableRole(Table table, Account account) {
        return table.masters.get(account.getId());
    }

    public Table getTable(Room room, int id) {
        return roomService.getTable(room, id);
    }

    public Integer id(Table table) {
        return table.id;
    }

    public Table createTable(Room room, String name, String pwd, int map, int max, int min) {
        Table table = new Table(roomService.uid(room), name, pwd, map, max, min);
        roomService.add(room, table);
        return table;
    }

    public boolean start(Table table) {
        return table.start;
    }

    public int count(Table table) {
        return table.masters.size();
    }

    public int max(Table table) {
        return table.max;
    }

    public String pwd(Table table) {
        return table.pwd;
    }

    public int min(Table table) {
        return table.min;
    }

    public boolean ready(Table table, Account account) {
        Table.TableRole role = table.masters.get(account.getId());
        if (role.ready) {
            return true;
        }
        role.ready = true;
        return false;
    }

    public boolean ready(Table table) {
        for (Table.TableRole role : table.masters.values()) {
            if (!role.ready) {
                return false;
            }
        }
        return true;
    }

    public Worker[] workers() {
        return workers;
    }

    public Worker worker(int id) {
        return HashUtil.object(workers, id);
    }

    public void startGame(Room room, Table table) {
        table.start = true;
        roomService.write(room, LogicClient.ReqTableUpdate.newBuilder().setId(table.id).setStart(table.start));

        table.catan = catanService.create(table);
    }

    public Map<Long, Table.TableRole> masters(Table table) {
        return table.masters;
    }
}
