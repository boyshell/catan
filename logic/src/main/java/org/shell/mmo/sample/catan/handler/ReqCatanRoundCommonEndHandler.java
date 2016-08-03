package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.Global.Module;
import org.shell.mmo.sample.message.proto.LogicClient;

public class ReqCatanRoundCommonEndHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanRoundCommonEnd> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanRoundCommonEnd message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        catan.getRound().end();
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanRoundCommonEnd.newBuilder().setError(e).build();
    }
}
