package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanRound;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanKnightCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanKnightCard> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanKnightCard message) {
        Global.Error error = catanService.canUseCard(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }

        Catan.CatanRole criminal = catan.getRoles().get(account.getId());
        if (!catanService.cardCheck(criminal, Global.CatanCardType.CARD_KNIGHT)) {
            NetUtil.write(channel, error(Global.Error.CATAN_NO_CARD));
            return;
        }

        Catan.CatanRole victim = catan.getRoles().get(message.getId());
        if (!catanService.canRob(criminal, victim, catan, message.getRobber())) {
            NetUtil.write(channel, error(Global.Error.CATAN_CAN_NOT_ROB));
            return;
        }
        Global.CatanResourceType robbed = catanService.rob(criminal, victim);
        LogicClient.ResCatanKnightCard.Builder ret = LogicClient.ResCatanKnightCard.newBuilder().setRobber(message.getRobber()).setCriminal(account.getId()).setVictim(message.getId());
        if (robbed != null) {
            ret.setResource(robbed);
        }

        catanService.write(catan, ret);

        catanService.payCard(criminal, Global.CatanCardType.CARD_KNIGHT);
        CatanRound.CatanCommonRound round = (CatanRound.CatanCommonRound)catan.getRound();
        round.setCard(false);
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanKnightCard.newBuilder().setError(e).build();
    }
}
