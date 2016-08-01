package org.shell.mmo.sample.role;

import org.shell.mmo.sample.catan.RoleCatan;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.room.RoleRoom;
import org.shell.mmo.sample.scene.RoleScene;

/**
 * Created by zhangxiangxi on 16/7/22.
 */
public class Role {
    private String name;
    private int level;
    private RoleScene scene = new RoleScene();
    private RoleCatan catan = new RoleCatan();
    private RoleRoom room = new RoleRoom();

    public RoleRoom getRoom() {
        return room;
    }

    public RoleCatan getCatan() {
        return catan;
    }

    public void setCatan(RoleCatan catan) {
        this.catan = catan;
    }

    public RoleScene getScene() {
        return scene;
    }

    public void setScene(RoleScene scene) {
        this.scene = scene;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Global.LeaderRole.Builder build() {
        Global.LeaderRole.Builder builder = Global.LeaderRole.newBuilder();
        builder.setName(getName());
        builder.setLevel(getLevel());
        builder.setScene(getScene().getId());
        return builder;
    }
}
