package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanMapShow;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ResCatanRoadCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanRoadCard> {
    @Override
    protected void execute(LogicClient.ResCatanRoadCard message) {
        CatanMap map = account.getRole().getTable().getMap();
        map.setRoad(message.getSrc1().getX(), message.getSrc1().getY(), message.getDst1().getX(), message.getDst1().getY(), message.getId());
        map.setRoad(message.getSrc2().getX(), message.getSrc2().getY(), message.getDst2().getX(), message.getDst2().getY(), message.getId());
        CatanMapShow.update();
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
