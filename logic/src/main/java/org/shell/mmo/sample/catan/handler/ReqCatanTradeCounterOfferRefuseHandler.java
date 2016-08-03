package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.catan.CatanRound;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanTradeCounterOfferRefuseHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanTradeCounterOfferRefuse> {
    @Inject
    CatanService catanService;
    @Inject
    AccountService accountService;

    @Override
    protected void execute(LogicClient.ReqCatanTradeCounterOfferRefuse message) {
        if (catan.getRound() == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_ROUND_NULL));
            return;
        }
        if (!(catan.getRound() instanceof CatanRound.CatanCommonRound)) {
            NetUtil.write(channel, error(Global.Error.CATAN_NOT_COMMON_ROUND));
            return;
        }

        CatanRound.CatanCommonRound round = (CatanRound.CatanCommonRound)catan.getRound();
        if (round.getMaster() == account.getId()) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_ERROR));
            return;
        }
        if (round.getTrade() == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_NULL));
            return;
        }

        if (round.getTrade().getCounters().containsKey(account.getId())) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_COUNTERED));
            return;
        }
        round.getTrade().getCounters().put(account.getId(), message);
        accountService.write(account, LogicClient.ResCatanTradeCounterOfferRefuse.newBuilder());
        accountService.write(round.getMaster(), LogicClient.ReqCatanTradeCounterOfferRefuseToMe.newBuilder().setId(account.getId()));
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCounterOfferRefuse.newBuilder().setError(e).build();
    }
}
