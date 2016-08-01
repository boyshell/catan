package org.shell.mmo.sample.table;

import com.google.inject.Inject;
import com.google.protobuf.MessageLite;
import com.shell.mmo.utils.HashUtil;
import com.shell.mmo.utils.thread.DisruptorWorker;
import com.shell.mmo.utils.thread.Worker;
import org.shell.mmo.sample.room.Room;
import org.shell.mmo.sample.room.RoomMessageHandler;
import org.shell.mmo.sample.room.RoomService;

/**
 * 需要自行实现
 */
public abstract class TableMessageHandler<K extends MessageLite> extends RoomMessageHandler<K> {
    protected Room room;
    protected Table table;

    @Inject
    TableService tableService;
    @Inject
    RoomService roomService;

    @Override
    protected Worker worker() {
        super.init();
        if (account == null || account.getRole() == null) {
            return null;
        }
        room = roomService.getRoom(account);
        if (room == null) {
            return null;
        }
        return tableService.worker(roomService.id(room));
    }

    @Override
    protected boolean filter() {
        int mod = HashUtil.mod(tableService.workers(), roomService.id(room));
        int key = DisruptorWorker.key();
        if (mod != key) {
            return true;
        }
        table = tableService.getTable(room, account);
        return false;
    }
}
