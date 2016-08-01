package org.shell.mmo.sample.catan;

import com.shell.mmo.utils.TimeUtil;
import org.shell.mmo.sample.message.proto.LogicClient;

/**
 * Created by zhangxiangxi on 16/7/29.
 */
public abstract class CatanRound {
    protected final Catan catan;
    protected final CatanService catanService;

    public CatanRound(Catan catan, CatanService catanService) {
        this.catan = catan;
        this.catanService = catanService;
    }

    public final void end() {
        catan.round = null;
        end0();
    }

    public abstract void end0();

    public abstract void start();

    // 初始化回合(放村庄道路,收获资源)
    static class CatanInitRound extends CatanRound {
        private final int time; // 到期时间
        private boolean auto = true; // TODO 需要捕捉玩家行为来设置未false
        public CatanInitRound(Catan catan, CatanService catanService, int time) {
            super(catan, catanService);
            this.time = time;
        }
        // 结束时,最后一个的话需要摇骰子

        @Override
        public void start() {
            catanService.write(catan, LogicClient.ReqCatanRoundInitStart.newBuilder()
                    .setId(catan.initList.get(0))
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
                catanService.addRound(catan, new CatanInitRound(catan, catanService, TimeUtil.seconds() + catanService.initSecond(catan)));
            }
        }

        private void randomSet(long master) {
            // TODO 自动放置村庄和路
        }
    }

    // 正常回合(抽卡(如果摇到7),建设,兑换,使用发展卡)
    static class CatanCommonRound extends CatanRound {
        public CatanCommonRound(Catan catan, CatanService catanService) {
            super(catan, catanService);
        }
        // 结束时,必定触发摇骰子事件->摇到7触发弃牌回合

        @Override
        public void end0() {
            // TODO 摇骰子
        }

        @Override
        public void start() {

        }
    }

    // 弃牌回合(摇到7)
    static class CatanFoldRound extends CatanRound {

        public CatanFoldRound(Catan catan, CatanService catanService) {
            super(catan, catanService);
        }

        @Override
        public void end0() {
            // TODO 手牌多余7张的,弃掉
            // TODO 进入正常回合,
        }

        @Override
        public void start() {

        }
    }
}
