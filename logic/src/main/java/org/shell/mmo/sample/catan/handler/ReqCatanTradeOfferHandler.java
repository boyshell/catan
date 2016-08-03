package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.CatanRound;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanTradeOfferHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanTradeOffer> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanTradeOffer message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        ((CatanRound.CatanCommonRound)catan.getRound()).setTrade(new CatanRound.CatanCommonRound.Trade());
        catanService.write(catan, LogicClient.ResCatanTradeOffer.newBuilder()
                .setId(account.getId())
                .addAllWant(message.getWantList())
                .addAllOffer(message.getOfferList()));
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeOffer.newBuilder().setError(e).build();
    }
}
