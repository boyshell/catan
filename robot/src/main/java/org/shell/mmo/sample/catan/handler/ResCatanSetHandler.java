package org.shell.mmo.sample.catan.handler;

import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanMapShow;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ResCatanSetHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ResCatanSet> {
    @Override
    protected void execute(LogicClient.ResCatanSet message) {
        CatanMap map = account.getRole().getTable().getMap();
        map.setCountry(message.getCountry().getX(), message.getCountry().getY(), message.getId());
        map.setRoad(message.getCountry().getX(), message.getCountry().getY(), message.getRoadDst().getX(), message.getRoadDst().getY(), message.getId());
        CatanMapShow.update();
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

}
