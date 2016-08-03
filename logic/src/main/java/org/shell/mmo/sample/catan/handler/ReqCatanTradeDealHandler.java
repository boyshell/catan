package org.shell.mmo.sample.catan.handler;

import com.google.inject.Inject;
import com.google.protobuf.MessageLite;
import com.shell.mmo.utils.net.NetUtil;
import org.shell.mmo.sample.catan.Catan;
import org.shell.mmo.sample.catan.CatanRound;
import org.shell.mmo.sample.catan.CatanService;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.message.proto.Global.Module;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;

public class ReqCatanTradeDealHandler extends org.shell.mmo.sample.catan.CatanMessageHandler<LogicClient.ReqCatanTradeDeal> {
    @Inject
    CatanService catanService;

    @Override
    protected void execute(LogicClient.ReqCatanTradeDeal message) {
        Global.Error error = catanService.commonRoundCheck(catan, account);
        if (error != null) {
            NetUtil.write(channel, error(error));
            return;
        }
        CatanRound.CatanCommonRound round = (CatanRound.CatanCommonRound) catan.getRound();
        if (round.getTrade() == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_NULL));
            return;
        }
        MessageLite messageLite = round.getTrade().getCounters().get(message.getTarget());
        if (messageLite == null) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_TARGET_ERROR));
            return;
        }
        if (!(messageLite instanceof LogicClient.ReqCatanTradeCounterOffer)) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_TARGET_ERROR));
            return;
        }
        LogicClient.ReqCatanTradeCounterOffer counter = (LogicClient.ReqCatanTradeCounterOffer)messageLite;
        Map<Global.CatanResourceType, Integer> masterResources1 = new HashMap<>(); // 开价者付出
        Map<Global.CatanResourceType, Integer> masterResources2 = new HashMap<>(); // 还价者付出
        for (Global.CatanResource r : counter.getWantList()) {
            add(masterResources1, r);
        }
        for (Global.CatanResource r : counter.getOfferList()) {
            add(masterResources2, r);
        }
        // 自己的资源够不够
        Catan.CatanRole role1 = catan.getRoles().get(account.getId());
        if (!check(role1, masterResources1)) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_OFFER_ERROR));
            return;
        }
        // 对方的资源够不够
        Catan.CatanRole role2 = catan.getRoles().get(message.getTarget());
        if (!check(role2, masterResources2)) {
            NetUtil.write(channel, error(Global.Error.CATAN_TRADE_WANT_ERROR));
            return;
        }
        change(role1, role2, masterResources1);
        change(role2, role1, masterResources2);

        catanService.write(catan, LogicClient.ResCatanTradeDeal.newBuilder()
                .setMaster1(convert(masterResources2))
                .setMaster2(convert(masterResources1)));
        round.setTrade(null);
    }

    private Global.CatanMasterResource.Builder convert(Map<Global.CatanResourceType, Integer> map) {
        Global.CatanMasterResource.Builder builder = Global.CatanMasterResource.newBuilder();
        map.forEach((type, num) -> builder.addResource(Global.CatanResource.newBuilder().setType(type).setNum(num)));
        return builder;
    }

    private void change(Catan.CatanRole from, Catan.CatanRole to, Map<Global.CatanResourceType, Integer> map) {
        map.forEach((type, num) -> {
            from.subResource(type, num);
            to.addResource(type, num);
        });
    }

    private boolean check(Catan.CatanRole role, Map<Global.CatanResourceType, Integer> map) {
        Iterator<Map.Entry<Global.CatanResourceType, Integer>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<Global.CatanResourceType, Integer> entry = it.next();
            if (role.getResource(entry.getKey()) < entry.getValue()) {
                return false;
            }
        }
        return true;
    }

    private void add(Map<Global.CatanResourceType, Integer> map, Global.CatanResource resource) {
        map.compute(resource.getType(), (type, num) -> num == null ? resource.getNum() : num + resource.getNum());
    }

    @Override
    public Module module() {
        return Module.CATAN;
    }

    @Override
    public com.google.protobuf.MessageLiteOrBuilder error(org.shell.mmo.sample.message.proto.Global.Error e) {
        return org.shell.mmo.sample.message.proto.LogicClient.ResCatanTradeDeal.newBuilder().setError(e).build();
    }
}
