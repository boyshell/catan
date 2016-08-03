package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanRoadCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanRoadCard> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanRoadCard message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (!catanService.cardCheck(role, Global.CatanCardType.CARD_ROAD)) {
            NetUtil.write(channel, error(Global.Error.CATAN_NO_CARD));
            return;
        }
        CatanMap.CatanEdge edge1 = catan.getMap().getEdges().get(new CatanMap.CatanEdge.Key(message.getSrc1().getX(), message.getSrc1().getY(), message.getDst1().getX(), message.getDst1().getY()));
        if (edge1 == null || catanService.buildRoad(catan, role, edge1)) {
            NetUtil.write(channel, error(Global.Error.CATAN_ILLEGAL_ROAD));
            return;
        }
        CatanMap.CatanEdge edge2 = catan.getMap().getEdges().get(new CatanMap.CatanEdge.Key(message.getSrc2().getX(), message.getSrc2().getY(), message.getDst2().getX(), message.getDst2().getY()));
        if (edge2 == null || catanService.buildRoad(catan, role, edge2)) {
            // 回滚1
            edge1.setOwner(0);
            NetUtil.write(channel, error(Global.Error.CATAN_ILLEGAL_ROAD));
            return;
        }

        catanService.payCard(role, Global.CatanCardType.CARD_ROAD);
        catanService.write(catan, LogicClient.ResCatanRoadCard.newBuilder()
                .setId(account.getId())
                .setSrc1(message.getSrc1())
                .setDst1(message.getDst1())
                .setSrc2(message.getSrc2())
                .setDst2(message.getDst2()));
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoadCard.newBuilder().setError(e).build();
    }
}
