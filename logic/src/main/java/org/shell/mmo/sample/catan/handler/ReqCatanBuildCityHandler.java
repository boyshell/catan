package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanBuildCityHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanBuildCity> {
    @Inject
    CatanService catanService;
    @Override
    protected void execute(LogicClient.ReqCatanBuildCity message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (!catanService.resourceCheck(role, CatanMap.BuildingType.CITY, 1)) {
            NetUtil.write(channel, error(Global.Error.CATAN_RESOURCE_NOT_ENOUGH));
            return;
        }
        CatanMap.CatanPoint point = catan.getMap().getPoints().get(message.getCity().getX(), message.getCity().getY());
        if (point == null || !catanService.buildCity(role, point)) {
            NetUtil.write(channel, error(Global.Error.CATAN_ILLEGAL_CITY));
            return ;
        }
        catanService.payResource(catan, role, CatanMap.BuildingType.CITY, 1);
        catanService.write(catan, LogicClient.ResCatanBuildCity.newBuilder().setId(account.getId()).setCity(message.getCity()));

        catanService.tryWin(table, catan, account);
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildCity.newBuilder().setError(e).build();
    }
}
