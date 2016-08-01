package org.shell.mmo.sample.role;

import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.room.RoleRoom;
import org.shell.mmo.sample.table.RoleTable;

/**
 * Created by zhangxiangxi on 16/7/28.
 */
public class Role {
    private final String name;
    private int scene;
    private int level;
    private final RoleRoom room = new RoleRoom();
    private final RoleTable table = new RoleTable();

    public Role(Global.LeaderRole bean) {
        this.name = bean.getName();
        this.scene = bean.getScene();
        this.level = bean.getLevel();
    }

    public RoleTable getTable() {
        return table;
    }

    public RoleRoom getRoom() {
        return room;
    }

    public String getName() {
        return name;
    }

    public int getScene() {
        return scene;
    }

    public void setScene(int scene) {
        this.scene = scene;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
