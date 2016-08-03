package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanMapShow;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanStartHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanStart> {
    @Override
    protected void execute(LogicClient.ReqCatanStart message) {
        CatanMap map = new CatanMap(message.getMap(), account.getRole().getTable());
        account.getRole().getTable().setMap(map);
        CatanMapShow.show(map);
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
