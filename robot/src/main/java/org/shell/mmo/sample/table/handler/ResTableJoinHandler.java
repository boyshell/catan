package org.shell.mmo.sample.table.handler;

import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.RoleTable;
import org.shell.mmo.sample.table.TableMessageHandler;

public class ResTableJoinHandler extends TableMessageHandler<LogicClient.ResTableJoin> {
    @Override
    protected void execute(LogicClient.ResTableJoin message) {
        RoleTable table = account.getRole().getTable();
        if (table.getId() != message.getId()) {
            table.setId(message.getId());
            account.getRole().getTable().getMasters().put(account.getId()
                    , Global.TableRole.newBuilder().setId(account.getId()).setName(account.getRole().getName()).setReady(false).build());
            NetUtil.write(channel, LogicClient.ReqTableReady.newBuilder());
        }
        for (Global.TableRole role : message.getMasterList()) {
            account.getRole().getTable().getMasters().put(role.getId(), role);
        }
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

}
