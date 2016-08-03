package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanRound;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanRobHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanRob> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanRob message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        CatanRound.CatanCommonRound round = (CatanRound.CatanCommonRound)catan.getRound();
        if (!round.isRob()) {
            NetUtil.write(channel, error(Global.Error.CATAN_CAN_NOT_ROB));
            return;
        }
        Catan.CatanRole victim = catan.getRoles().get(message.getId());
        if (victim == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_CAN_NOT_ROB));
            return;
        }
        Catan.CatanRole criminal = catan.getRoles().get(account.getId());

        if (!catanService.canRob(criminal, victim, catan, message.getRobber())) {
            NetUtil.write(channel, error(Global.Error.CATAN_CAN_NOT_ROB));
            return;
        }
        Global.CatanResourceType robbed = catanService.rob(criminal, victim);
        LogicClient.ResCatanRob.Builder ret = LogicClient.ResCatanRob.newBuilder().setCriminal(criminal.getId()).setVictim(victim.getId()).setRobber(message.getRobber());
        if (robbed != null) {
            ret.setResource(robbed);
        }
        catanService.write(catan, ret);

        round.setRob(false);
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanRob.newBuilder().setError(e).build();
    }
}
