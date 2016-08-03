package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanMapShow;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ResCatanBuildRoadHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanBuildRoad> {
    @Override
    protected void execute(LogicClient.ResCatanBuildRoad message) {
        CatanMap map = account.getRole().getTable().getMap();
        map.setRoad(message.getSrc().getX(), message.getSrc().getY(), message.getDst().getX(), message.getDst().getY(), message.getId());
        CatanMapShow.update();
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
