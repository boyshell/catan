package org.shell.mmo.sample.table;

import com.google.inject.Inject;
import com.google.protobuf.MessageLite;
import org.shell.mmo.sample.message.MessageHandler;
import org.shell.mmo.sample.room.Room;
import org.shell.mmo.sample.room.RoomService;

/**
 */
public abstract class TableMessageHandler<T extends MessageLite> extends MessageHandler<T> {
    @Inject
    RoomService roomService;

    protected Room room;
    @Override
    protected boolean filter() {
        room = roomService.getRoom(account.getRole().getRoom().getId());
        return super.filter();
    }
}