package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanMonopolyCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanMonopolyCard> {
    @Inject
    CatanService catanService;
    @Override
    protected void execute(LogicClient.ReqCatanMonopolyCard message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (!catanService.cardCheck(role, Global.CatanCardType.CARD_MONOPOLY)) {
            NetUtil.write(channel, error(Global.Error.CATAN_NO_CARD));
            return;
        }

        LogicClient.ResCatanMonopolyCard.Builder ret = LogicClient.ResCatanMonopolyCard.newBuilder().setId(account.getId());
        int count = 0;
        for (Catan.CatanRole tmp : catan.getRoles().values()) {
            if (tmp == role) {
                continue;
            }
            Global.CatanResource.Builder resource = catanService.subAllResource(tmp, message.getType());
            if (resource != null) {
                count += resource.getNum();
                ret.addLose(Global.CatanMasterResource.newBuilder().setId(tmp.getId()).addResource(resource));
            }
        }

        role.addResource(message.getType(), count);

        catanService.payCard(catan, role, Global.CatanCardType.CARD_MONOPOLY);
        catanService.write(catan, ret);
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanMonopolyCard.newBuilder().setError(e).build();
    }
}
