package org.shell.mmo.sample.catan;

import com.google.common.base.Preconditions;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.protobuf.MessageLiteOrBuilder;
import com.shell.mmo.utils.RandomUtil;
import com.shell.mmo.utils.TimeUtil;
import org.shell.mmo.sample.account.Account;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.config.ConfigGroup;
import org.shell.mmo.sample.config.bean.CcatanMap;
import org.shell.mmo.sample.message.proto.Global;
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

    /**
     * 掷骰子
     * @return
     */
    public void throwDice(Catan catan) {
        catan.dice = RandomUtil.random(1, 9) + RandomUtil.random(1, 9);
        if (catan.dice == 7) {
            addRound(catan, new CatanRound.CatanFoldRound(catan, this));
        } else {
            addRound(catan, new CatanRound.CatanCommonRound(catan, this, false));
        }
    }

    public Catan create(Table table) {
        CcatanMap catanMap = configGroup.catanMapContainer.getMap().get(tableService.id(table));
        List<Long> masters = RandomUtil.random(new ArrayList<>(tableService.masters(table).keySet()));
        Catan catan = new Catan(new CatanMap(catanMap), initMasters(masters), catanRoles(masters));

        write(catan, LogicClient.ReqCatanStart.newBuilder().setMap(catan.map.build()));

        addRound(catan, new CatanRound.CatanInitRound(catan, this));
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

    public void timer(Catan catan) {
        if (catan == null) {
            return;
        }
        if (catan.round.getTime() > TimeUtil.seconds()) {
            return;
        }
        catan.round.end();
    }

    public boolean buildCountry(Catan.CatanRole role, CatanMap.CatanPoint point, boolean init) {
        // 村庄合法性:周围不能有相邻的村庄,有自己的道路联通(初始化回合不用)
        boolean edgeConnect = init;
        for (CatanMap.CatanEdge edge : point.edges) {
            if (edge.getPoint1().buildingType != null
                    ||  edge.getPoint2().buildingType != null) {
                return false;
            }
            if (edge.owner == role.getId()) {
                edgeConnect = true;
            }
        }
        if (!edgeConnect) {
            return false;
        }
        point.owner = role.id;
        point.buildingType = CatanMap.BuildingType.COUNTRY;
        role.countries.add(point);
        // 可能会有港口
        for (CatanMap.CatanEdge edge : point.edges) {
            if (edge.type != null) {
                role.ports.add(edge.type);
            }
        }
        return true;
    }

    public Global.Error commonRoundCheck(Catan catan, Account account) {
        if (catan.getRound() == null) {
            return Global.Error.CATAN_ROUND_NULL;
        }
        if (!(catan.getRound() instanceof CatanRound.CatanCommonRound)) {
            return Global.Error.CATAN_NOT_COMMON_ROUND;
        }
        CatanRound.CatanCommonRound round = (CatanRound.CatanCommonRound)catan.getRound();
        if (round.getMaster() != account.getId()) {
            return Global.Error.CATAN_NOT_MY_ROUND;
        }
        return null;
    }

    public boolean buildRoad(Catan catan, Catan.CatanRole role, CatanMap.CatanEdge edge) {
        // 道路合法性,必须要有连接的道路或者村庄/城市
        if (!buildRoadCheck(catan, role, edge)) {
            return false;
        }
        edge.owner = role.getId();
        role.edges.add(edge);
        return true;
    }

    private boolean buildRoadCheck(Catan catan, Catan.CatanRole role, CatanMap.CatanEdge edge) {
        if (catan.getRoles().containsKey(edge.owner)) {
            return false;
        }
        if (edge.getPoint1().owner == role.getId() || edge.getPoint2().owner == role.getId()) {
            return true;
        }
        for (CatanMap.CatanEdge tmp : edge.point1.edges) {
            if (tmp == edge) {
                continue;
            }
            if (tmp.getPoint1().owner == role.getId() || tmp.getPoint2().owner == role.getId()) {
                return true;
            }
        }
        for (CatanMap.CatanEdge tmp : edge.point2.edges) {
            if (tmp == edge) {
                continue;
            }
            if (tmp.getPoint1().owner == role.getId() || tmp.getPoint2().owner == role.getId()) {
                return true;
            }
        }
        return false;
    }

    public boolean resourceCheck(Catan.CatanRole role, CatanMap.BuildingType type, int count) {
        for (Global.CatanResource resource : type.getCost()) {
            if (role.getResource(resource.getType()) < resource.getNum() * count) {
                return false;
            }
        }
        return true;
    }

    public void payAllResource(Catan.CatanRole role, CatanMap.BuildingType type, int count) {
        for (Global.CatanResource resource : type.getCost()) {
            role.subResource(resource.getType(), resource.getNum() * count);
        }
    }

    public boolean buildCity(Catan.CatanRole role, CatanMap.CatanPoint point) {
        // 城市合法性:存在自己的村庄
        if (point.owner != role.getId()) {
            return false;
        }
        if (point.buildingType != CatanMap.BuildingType.COUNTRY) {
            return false;
        }
        point.buildingType = CatanMap.BuildingType.CITY;
        role.countries.remove(point);
        role.cities.add(point);
        return true;
    }

    public List<Global.CatanCard> addCard(Catan.CatanRole role, int count) {
        List<Global.CatanCard> list = new ArrayList<>();
        for (int i = 0; i < count; ++i) {
            Global.CatanCardType type = Global.CatanCardType.valueOf(RandomUtil.random(1, Global.CatanCardType.values().length + 1));
            role.addCard(type, 1);
            list.add(Global.CatanCard.newBuilder().setType(type).setCount(1).build());
        }
        return list;
    }

    public int tradSysten(Catan.CatanRole role, Global.CatanResourceType type, int num) {
        // 有限指定资源
        if (role.ports.contains(r2p(type))) {
            return trade(num, 2);
        }
        // 3比1港口
        if (role.ports.contains(Global.CatanPortType.PORT_BANK)) {
            return trade(num, 3);
        }
        // 4比1系统
        return trade(num, 4);
    }

    private int trade(int count, int ratio) {
        if (count % ratio != 0) {
            return -1;
        }
        return count / ratio;
    }

    private Global.CatanPortType r2p(Global.CatanResourceType type) {
        switch (type) {
            case RESOURCE_LUMBER:
                return Global.CatanPortType.PORT_LUMBER;
            case RESOURCE_BRICK:
                return Global.CatanPortType.PORT_BRICK;
            case RESOURCE_WOOL:
                return Global.CatanPortType.PORT_WOOL;
            case RESOURCE_GAIN:
                return Global.CatanPortType.PORT_GAIN;
            case RESOURCE_ORE:
                return Global.CatanPortType.PORT_ORE;
        }
        return null;
    }

    public boolean canRob(Catan.CatanRole criminal, Catan.CatanRole victim, Catan catan, Global.Position gridPosition) {
        // 目标不是能是自己
        if (criminal == victim) {
            return false;
        }
        // 非强盗当前点
        CatanMap.CatanGrid grid = catan.getMap().getGrids().get(gridPosition.getX(), gridPosition.getY());
        if (grid == null) {
            return false;
        }
        if (catan.getMap().getRobber().grid == grid) {
            return false;
        }
        // 允许目标为空
        // 目标不为空则必须在格子的顶点
        if (victim != null) {
            boolean flag = false;
            for (CatanMap.CatanPoint point : grid.getPoints()) {
                if (point.owner == victim.getId()) {
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                return false;
            }
        }
        return true;
    }

    public Global.CatanResourceType rob(Catan.CatanRole criminal, Catan.CatanRole victim) {
        if (victim == null) {
            return null;
        }
        List<Global.CatanResourceType> list = new ArrayList<>();
        for (Global.CatanResourceType type : Global.CatanResourceType.values()) {
            if (victim.getResource(type) > 0) {
                list.add(type);
            }
        }
        if (list.isEmpty()) {
            return null;
        }
        Global.CatanResourceType type = list.get(RandomUtil.random(0, list.size()));

        criminal.addResource(type, 1);
        victim.subResource(type, 1);
        return type;
    }

    public Global.Error canUseCard(Catan catan, Account account) {
        Global.Error error = commonRoundCheck(catan, account);
        if (error != null) {
            return error;
        }
        CatanRound.CatanCommonRound round = (CatanRound.CatanCommonRound)catan.getRound();
        if (!round.card) {
            return Global.Error.CATAN_CAN_NOT_USE;
        }
        return null;
    }

    public boolean cardCheck(Catan.CatanRole role, Global.CatanCardType type) {
        return role.getCard(type) > 0;
    }

    public void payCard(Catan.CatanRole role, Global.CatanCardType type) {
        role.subCard(type, 1);
    }

    public Global.CatanResource.Builder payAllResource(Catan.CatanRole role, Global.CatanResourceType type) {
        int count = role.getResource(type);
        role.subResource(type, count);
        return Global.CatanResource.newBuilder().setType(type).setNum(count);
    }

    public void addResource(Catan.CatanRole role, Global.CatanResourceType type, int count) {
        role.addResource(type, count);
    }

    public List<Global.CatanResource> fold(Catan.CatanRole role, List<Global.CatanResource> loseList) {
        int total = 0;
        int count = 0;
        for (int resource : role.resource) {
            total += resource;
        }
        if (total < 8) {
            return null;
        }
        for (Global.CatanResource r : loseList) {
            if (role.getResource(r.getType()) < r.getNum()) {
                return null;
            }
            count += r.getNum();
        }
        if (total / 2 != count) {
            return null;
        }
        for (Global.CatanResource r : loseList) {
            role.subResource(r.getType(), r.getNum());
        }
        return loseList;
    }
}
