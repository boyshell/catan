package org.shell.mmo.sample.table;

import com.google.inject.Singleton;
import org.shell.mmo.sample.message.proto.Global;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
@Singleton
public class TableService {
    public Table create(Global.GameTable table) {
        return new Table(table.getId(), table.getName(), table.getPwd(), table.getMax(), table.getMap(), table.getCount(), table.getStart());
    }
}
