package org.shell.mmo.sample.catan;

import com.google.inject.Inject;
import com.google.protobuf.MessageLite;
import org.shell.mmo.sample.table.TableMessageHandler;
import org.shell.mmo.sample.table.TableService;

/**
 * 需要自行实现
 */
public abstract class CatanMessageHandler<T extends MessageLite> extends TableMessageHandler<T> {
    protected Catan catan;

    @Inject
    TableService tableService;

    @Override
    protected boolean filter() {
        if (super.filter()) {
            return true;
        }
        if (table == null) {
            return true;
        }
        catan = tableService.catan(table);
        if (catan == null) {
            return true;
        }
        return false;
    }
}
