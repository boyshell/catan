package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanBuildCountryHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanBuildCountry> {
    @Inject
    CatanService catanService;
    @Override
    protected void execute(LogicClient.ReqCatanBuildCountry message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (!catanService.resourceCheck(role, CatanMap.BuildingType.COUNTRY, 1)) {
            NetUtil.write(channel, error(Global.Error.CATAN_RESOURCE_NOT_ENOUGH));
            return;
        }
        CatanMap.CatanPoint point = catan.getMap().getPoints().get(message.getCountry().getX(), message.getCountry().getY());
        if (point == null || !catanService.buildCountry(role, point, false)) {
            NetUtil.write(channel, error(Global.Error.CATAN_ILLEGAL_COUNTRY));
            return ;
        }
        catanService.payAllResource(role, CatanMap.BuildingType.COUNTRY, 1);
        catanService.write(catan, LogicClient.ResCatanBuildCountry.newBuilder().setId(account.getId()).setCountry(message.getCountry()));
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildCountry.newBuilder().setError(e).build();
    }
}
