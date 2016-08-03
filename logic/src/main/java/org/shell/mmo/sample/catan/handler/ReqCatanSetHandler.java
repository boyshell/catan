package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanRound;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanSetHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanSet> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanSet message) {
        if (catan.getRound() == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_ROUND_NULL));
            return ;
        }
        if (!(catan.getRound() instanceof CatanRound.CatanInitRound)) {
            NetUtil.write(channel, error(Global.Error.CATAN_NOT_INIT_ROUND));
            return ;
        }
        CatanRound.CatanInitRound round = (CatanRound.CatanInitRound)catan.getRound();
        if (round.getMaster() != account.getId()) {
            NetUtil.write(channel, error(Global.Error.CATAN_NOT_MY_ROUND));
            return ;
        }
        CatanMap.CatanPoint point = catan.getMap().getPoints().get(message.getCountry().getX(), message.getCountry().getY());
        if (point == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_ILLEGAL_COUNTRY));
            return ;
        }
        CatanMap.CatanEdge edge = catan.getMap().getEdges().get(new CatanMap.CatanEdge.Key(message.getCountry().getX(), message.getCountry().getY(), message.getRoadDst().getX(), message.getRoadDst().getY()));
        if (edge == null || !point.getEdges().contains(edge)) {
            NetUtil.write(channel, error(Global.Error.CATAN_ILLEGAL_ROAD));
            return ;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (!catanService.buildCountry(role, point, true)) {
            NetUtil.write(channel, error(Global.Error.CATAN_ILLEGAL_COUNTRY));
            return ;
        }
        LogicClient.ResCatanSet.Builder ret = LogicClient.ResCatanSet.newBuilder().setCountry(message.getCountry()).setRoadDst(message.getRoadDst()).setId(account.getId());
        if (catan.getInitList().size() <= catan.getRoles().size()) {
            for (Global.CatanResourceType type : Global.CatanResourceType.values()) {
                if (point.isSet(type)) {
                    catanService.addResource(role, type, 1);
                    ret.addResource(Global.CatanResource.newBuilder().setType(type).setNum(1));
                }
            }
        }
        catanService.buildRoad(catan, role, edge);
        catanService.write(catan, ret);
        round.setAuto(false);
        round.end();
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanSet.newBuilder().setError(e).build();
    }
}
