package org.shell.mmo.sample.room;

import com.google.inject.Inject;
import com.google.protobuf.MessageLite;
import com.shell.mmo.utils.thread.Worker;
import org.shell.mmo.sample.role.RoleMessageHandler;

/**
 * 需要自行实现
 */
public abstract class RoomMessageHandler<K extends MessageLite> extends RoleMessageHandler<K> {
    @Inject
    RoomService roomService;

    @Override
    protected Worker worker() {
        return roomService.worker();
    }

    @Override
    protected boolean filter() {
        if (account == null || account.getRole() == null) {
            return true;
        }
        return false;
    }

    @Override
    protected Object sync() {
        super.init();
        if (account == null || account.getRole() == null) {
            return null;
        }
        return account.getRole().getRoom();
    }
}
