package org.shell.mmo.sample.catan;

import java.util.List;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
public class Catan {
    final CatanMap map;
    final List<Long> initList; // 需要初始化的玩家
    final Map<Long, CatanRole> roles;
    CatanRound round;

    public Catan(CatanMap map, List<Long> initList, Map<Long, CatanRole> roles) {
        this.map = map;
        this.initList = initList;
        this.roles = roles;
    }

    public static class CatanRole {
        final long id;

        public CatanRole(long id) {
            this.id = id;
        }
    }
}
