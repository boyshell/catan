package org.shell.mmo.sample.catan;

import com.google.protobuf.MessageLite;
import com.shell.mmo.utils.RandomUtil;
import com.shell.mmo.utils.TimeUtil;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.message.proto.LogicClient;

import java.util.*;

/**
 * Created by zhangxiangxi on 16/7/29.
 */
public abstract class CatanRound {
    protected final Catan catan;
    protected final CatanService catanService;
    protected final int time; // 到期时间

    public int getTime() {
        return time;
    }

    public CatanRound(Catan catan, CatanService catanService, int time) {
        this.catan = catan;
        this.catanService = catanService;
        this.time = time;
    }

    public final void end() {
        catan.round = null;
        end0();
    }

    protected abstract void end0();

    public abstract void start();

    // 初始化回合(放村庄道路,收获资源)
    public static class CatanInitRound extends CatanRound {
        private final static int ROUND_SECOND = 5;
        boolean auto = true;
        final long master; // 哪个玩家的回合?

        public void setAuto(boolean auto) {
            this.auto = auto;
        }

        public boolean isAuto() {
            return auto;
        }

        public long getMaster() {
            return master;
        }

        public CatanInitRound(Catan catan, CatanService catanService) {
            super(catan, catanService, TimeUtil.seconds() + ROUND_SECOND);
            this.master = catan.initList.get(0);
        }
        // 结束时,最后一个的话需要摇骰子

        @Override
        public void start() {
            catanService.write(catan, LogicClient.ReqCatanRoundInitStart.newBuilder()
                    .setId(master)
                    .setRemain(time - TimeUtil.seconds()));
        }

        @Override
        public void end0() {
            long master = catan.initList.remove(0);
            if (auto) {
                randomSet(master);
            }
            if (catan.initList.isEmpty()) { // 摇骰子来进入回合
                catanService.throwDice(catan);
            } else { // 进入初始化回合
                catanService.addRound(catan, new CatanInitRound(catan, catanService));
            }
        }

        private void randomSet(long master) {
            Catan.CatanRole role = catan.getRoles().get(master);
            List<CatanMap.CatanPoint> list = new ArrayList<>(catan.getMap().getPoints().values());
            list = RandomUtil.random(list);
            for (CatanMap.CatanPoint point : list) {
                if (catanService.buildCountry(role, point, true)) {
                    CatanMap.CatanEdge edge = null;
                    for (CatanMap.CatanEdge tmp : point.edges) {
                        if (tmp.owner == 0) {
                            edge = tmp;
                            break;
                        }
                    }
                    catanService.buildRoad(catan, role, edge, true);
                    CatanMap.CatanPoint dst = point == edge.point1 ? edge.point2 : edge.point1;

                    LogicClient.ResCatanSet.Builder ret = LogicClient.ResCatanSet.newBuilder()
                            .setCountry(Global.Position.newBuilder().setX(point.x).setY(point.y))
                            .setRoadDst(Global.Position.newBuilder().setX(dst.getX()).setY(dst.y))
                            .setId(master);
                    if (catan.getInitList().size() <= catan.getRoles().size()) {
                        for (Global.CatanResourceType type : Global.CatanResourceType.values()) {
                            if (point.isSet(type)) {
                                ret.addResource(catanService.produceResource(catan, role, type, 1));
                            }
                        }
                    }
                    catanService.write(catan, ret);
                    return;
                }
            }
        }
    }

    // 正常回合(抽卡(如果摇到7),建设,兑换,使用发展卡)
    public static class CatanCommonRound extends CatanRound {
        private final static int ROUND_SECOND = 5;
        final long master; // 哪个玩家的回合?
        boolean rob;
        boolean card;
        Trade trade;

        public long getMaster() {
            return master;
        }

        public CatanCommonRound(Catan catan, CatanService catanService, boolean rob) {
            super(catan, catanService, TimeUtil.seconds() + ROUND_SECOND);
            master = catan.commonList.get(catan.pos);
            catan.pos = (++catan.pos) % catan.commonList.size();
            this.card = true;
            this.rob = rob;
        }

        public Trade getTrade() {
            return trade;
        }

        public void setTrade(Trade trade) {
            this.trade = trade;
        }

        public void setCard(boolean card) {
            this.card = card;
        }

        public boolean isRob() {
            return rob;
        }

        public void setRob(boolean rob) {
            this.rob = rob;
        }

        @Override
        public void end0() {
            catanService.throwDice(catan);
        }

        @Override
        public void start() {
            LogicClient.ReqCatanRoundCommonStart.Builder msg = LogicClient.ReqCatanRoundCommonStart.newBuilder()
                    .setId(master)
                    .setRemain(time - TimeUtil.seconds())
                    .setDice(catan.dice);
            if (catan.dice != 7) {
                for (CatanMap.CatanGrid grid : catan.getMap().getDice2grid().get(catan.dice)) {
                    for (CatanMap.CatanPoint point : grid.getPoints()) {
                        int count;
                        if (point.buildingType == CatanMap.BuildingType.COUNTRY) {
                            count = 1;
                        } else if (point.buildingType == CatanMap.BuildingType.CITY) {
                            count = 2;
                        } else {
                            continue;
                        }
                        msg.addGain(Global.CatanMasterResource.newBuilder()
                                .setId(point.getOwner())
                                .addResource(catanService.produceResource(catan, catan.getRoles().get(point.getOwner()), grid.getType(), count)));
                    }
                }
            }
            catanService.write(catan, msg);
        }

        public static class Trade {
            private Map<Long, MessageLite> counters = new HashMap<>();

            public Map<Long, MessageLite> getCounters() {
                return counters;
            }
        }
    }

    // 弃牌回合(摇到7)
    public static class CatanFoldRound extends CatanRound {
        private final static int ROUND_SECOND = 5;
        Set<Long> set = new HashSet<>();
        public CatanFoldRound(Catan catan, CatanService catanService) {
            super(catan, catanService, TimeUtil.seconds() + ROUND_SECOND);
        }

        public Set<Long> getSet() {
            return set;
        }

        @Override
        public void end0() {
            // 手牌多余7张的(不在set中),弃掉
            for (Catan.CatanRole role : catan.getRoles().values()) {
                if (set.contains(role.getId())) {
                    continue;
                }
                List<Global.CatanResource> list = new ArrayList<>();
                for (Global.CatanResourceType type : Global.CatanResourceType.values()) {
                    for (int i = 0; i < role.getResource(type); ++i) {
                        list.add(Global.CatanResource.newBuilder().setType(type).setNum(1).build());
                    }
                }
                if (list.size() < 8) {
                    continue;
                }
                list = RandomUtil.random(list);
                list = list.subList(0, list.size() / 2);
                catanService.fold(catan, role, list);
                catanService.write(catan, LogicClient.ResCatanFold.newBuilder().setId(role.getId()).addAllLose(list));
            }

            catanService.addRound(catan, new CatanCommonRound(catan, catanService, true));
        }

        @Override
        public void start() {
            catanService.write(catan, LogicClient.ReqCatanRoundFoldStart.newBuilder().setRemain(time - TimeUtil.seconds()));
        }
    }
}
