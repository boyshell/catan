package org.shell.mmo.sample.table;

import org.shell.mmo.sample.catan.CatanMap;
import org.shell.mmo.sample.message.proto.Global;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
public class RoleTable {
    private Map<Long, Global.TableRole> masters = new HashMap<>();
    private int id = -1;
    private CatanMap map;

    public CatanMap getMap() {
        return map;
    }

    public void setMap(CatanMap map) {
        this.map = map;
    }

    public long getId() {
        return id;
    }

    public Map<Long, Global.TableRole> getMasters() {
        return masters;
    }

    public void setId(int id) {
        this.id = id;
    }
}
