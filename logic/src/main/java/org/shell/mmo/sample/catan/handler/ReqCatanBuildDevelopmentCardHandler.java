package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

public class ReqCatanBuildDevelopmentCardHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanBuildDevelopmentCard> {
    @Inject
    CatanService catanService;
    @Override
    protected void execute(LogicClient.ReqCatanBuildDevelopmentCard message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        Catan.CatanRole role = catan.getRoles().get(account.getId());
        if (!catanService.resourceCheck(role, CatanMap.BuildingType.CARD, message.getCount())) {
            NetUtil.write(channel, error(Global.Error.CATAN_RESOURCE_NOT_ENOUGH));
            return;
        }
        catanService.payAllResource(role, CatanMap.BuildingType.CARD, message.getCount());
        catanService.write(catan
                , LogicClient.ResCatanBuildDevelopmentCard.newBuilder()
                        .setId(account.getId())
                        .addAllCard(catanService.addCard(role, message.getCount())));
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanBuildDevelopmentCard.newBuilder().setError(e).build();
    }
}
