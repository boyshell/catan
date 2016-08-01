package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.TableMessageHandler;

public class ResTableExitHandler extends TableMessageHandler<LogicClient.ResTableExit> {
    @Override
    protected void execute(LogicClient.ResTableExit message) {
        if (message.getId() == account.getId()) {
            account.getRole().getTable().setId(-1);
            account.getRole().getTable().getMasters().clear();
        } else {
            account.getRole().getTable().getMasters().remove(message.getId());
        }
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

}
