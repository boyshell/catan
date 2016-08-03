package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanTradeSystemHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanTradeSystem> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanTradeSystem message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        int count = 0;
        for (Global.CatanResource resource : message.getOfferList()) {
            int tmp = catanService.tradSysten(role, resource.getType(), resource.getNum());
            if (tmp <= 0) {
                NetUtil.write(channel, error(Global.Error.CATAN_TRADE_SYSTEM));
                return;
            }
            count += tmp;
        }

        for (Global.CatanResource resource : message.getWantList()) {

            count -= resource.getNum();
        }
        if (count != 0) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_SYSTEM));
            return;
        }

        catanService.write(catan, LogicClient.ResCatanTradeSystem.newBuilder().setId(account.getId()).addAllOffer(message.getOfferList()).addAllWant(message.getWantList()));
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeSystem.newBuilder().setError(e).build();
    }
}
