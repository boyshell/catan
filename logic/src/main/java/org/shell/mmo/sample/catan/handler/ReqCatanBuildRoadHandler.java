package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanBuildRoadHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanBuildRoad> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanBuildRoad message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (!catanService.resourceCheck(role, CatanMap.BuildingType.ROAD, 1)) {
            NetUtil.write(channel, error(Global.Error.CATAN_RESOURCE_NOT_ENOUGH));
            return;
        }
        CatanMap.CatanEdge edge = catan.getMap().getEdges().get(new CatanMap.CatanEdge.Key(message.getSrc().getX(), message.getSrc().getY(), message.getDst().getX(), message.getDst().getY()));
        if (edge == null || !catanService.buildRoad(catan, role, edge)) {
            NetUtil.write(channel, error(Global.Error.CATAN_ILLEGAL_ROAD));
            return ;
        }
        catanService.payAllResource(role, CatanMap.BuildingType.ROAD, 1);
        catanService.write(catan, LogicClient.ResCatanBuildRoad.newBuilder().setSrc(message.getSrc()).setDst(message.getDst()).setId(account.getId()));
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildRoad.newBuilder().setError(e).build();
    }
}
