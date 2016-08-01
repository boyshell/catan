package org.shell.mmo.sample.table.handler;

import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.TableMessageHandler;

public class ResTableReadyHandler extends TableMessageHandler<LogicClient.ResTableReady> {
    @Override
    protected void execute(LogicClient.ResTableReady message) {
        Global.TableRole.Builder builder = Global.TableRole.newBuilder(account.getRole().getTable().getMasters().get(message.getId()));
        account.getRole().getTable().getMasters().put(message.getId(), builder.build());
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

}
