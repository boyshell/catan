package org.shell.mmo.sample.catan;

import com.google.common.base.Preconditions;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.protobuf.MessageLiteOrBuilder;
import com.shell.mmo.utils.RandomUtil;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.config.ConfigGroup;
import org.shell.mmo.sample.config.bean.CcatanMap;
import org.shell.mmo.sample.message.proto.LogicClient;
import org.shell.mmo.sample.table.Table;
import org.shell.mmo.sample.table.TableService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/7/27.
 */
@Singleton
public class CatanService {
    @Inject
    AccountService accountService;
    @Inject
    TableService tableService;
    @Inject
    ConfigGroup configGroup;

    public void write(Catan catan, MessageLiteOrBuilder msg) {
        for (long id : catan.roles.keySet()) {
            accountService.write(id, msg);
        }
    }

    public void addRound(Catan catan, CatanRound round) {
        Preconditions.checkArgument(catan.round == null);
        catan.round = round;
        round.start();
    }

    public int initSecond(Catan catan) {
        // TODO 获取初始化单轮时间
        return 0;
    }

    /**
     * 掷骰子
     * @return
     */
    public int throwDice(Catan catan) {
        // TODO 获取数字,根据数字进入不同的回合
        return 0;
    }

    public Catan create(Table table) {
        CcatanMap catanMap = configGroup.catanMapContainer.getMap().get(tableService.id(table));
        List<Long> masters = RandomUtil.random(new ArrayList<>(tableService.masters(table).keySet()));
        Catan catan = new Catan(new CatanMap(catanMap), initMasters(masters), catanRoles(masters));

        write(catan, LogicClient.ReqCatanStart.newBuilder().setMap(catan.map.build()));

        addRound(catan, new CatanRound.CatanInitRound(catan, this, 10));
        return catan;

    }

    private Map<Long, Catan.CatanRole> catanRoles(List<Long> masters) {
        Map<Long, Catan.CatanRole> map = new HashMap<>();
        for (long id : masters) {
            map.put(id, new Catan.CatanRole(id));
        }
        return map;
    }

    private List<Long> initMasters(List<Long> masters) {
        List<Long> ret = new ArrayList<>(masters);
        for (int i = masters.size() - 1; i >= 0; --i) {
            ret.add(masters.get(i));
        }
        return ret;
    }
}
