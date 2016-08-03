package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.CatanRound;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanTradeCancelHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanTradeCancel> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanTradeCancel message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        if (((CatanRound.CatanCommonRound)catan.getRound()).getTrade() == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_NULL));
            return;
        }
        catanService.write(catan, LogicClient.ResCatanTradeCancel.newBuilder());
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeCancel.newBuilder().setError(e).build();
    }
}
