package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanRound;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanFoldHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanFold> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanFold message) {
        if (catan.getRound() == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_ROUND_NULL));
            return;
        }
        if (!(catan.getRound() instanceof CatanRound.CatanFoldRound)) {
            NetUtil.write(channel, error(Global.Error.CATAN_NOT_FOLD_ROUND));
            return;
        }
        CatanRound.CatanFoldRound round = (CatanRound.CatanFoldRound)catan.getRound();
        if (round.getSet().contains(account.getId())) {
            NetUtil.write(channel, error(Global.Error.CATAN_FOLD_ALREADY));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (catanService.fold(role, message.getLoseList()) == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_PARAM_ERROR));
            return;
        }
        catanService.write(catan, LogicClient.ResCatanFold.newBuilder().setId(account.getId()).addAllLose(message.getLoseList()));
        round.getSet().add(account.getId());
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanFold.newBuilder().setError(e).build();
    }
}
