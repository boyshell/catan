package org.shell.mmo.sample.table.handler;

import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.TableMessageHandler;

public class ResTableCreateHandler extends TableMessageHandler<LogicClient.ResTableCreate> {

    @Override
    protected void execute(LogicClient.ResTableCreate message) {
        account.getRole().getTable().setId(message.getId());
        account.getRole().getTable().getMasters().put(account.getId()
                , Global.TableRole.newBuilder().setId(account.getId()).setName(account.getRole().getName()).setReady(false).build());
        NetUtil.write(channel, LogicClient.ReqTableReady.newBuilder());
    }

    @Override
    public Module module() {
        return Module.TABLE;
    }

}
