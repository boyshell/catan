package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanRichCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanRichCard> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanRichCard message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (!catanService.cardCheck(role, Global.CatanCardType.CARD_RICH)) {
            NetUtil.write(channel, error(Global.Error.CATAN_NO_CARD));
            return;
        }
        if (message.getResourceCount() != 2) {
            NetUtil.write(channel, error(Global.Error.CATAN_PARAM_ERROR));
            return;
        }
        for (Global.CatanResourceType type : message.getResourceList()) {
            catanService.addResource(role, type, 1);
        }

        catanService.payCard(role, Global.CatanCardType.CARD_RICH);
        catanService.write(catan, LogicClient.ResCatanRichCard.newBuilder().setId(account.getId()).addAllResource(message.getResourceList()));
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanRichCard.newBuilder().setError(e).build();
    }
}
