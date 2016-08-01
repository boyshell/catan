package org.shell.mmo.sample.account;

import io.netty.channel.Channel;
import org.shell.mmo.sample.message.proto.Global;
import org.shell.mmo.sample.role.Role;

/**
 * Created by zhangxiangxi on 16/7/28.
 */
public class Account {
    private final Channel channel;
    private long id;
    private String usr;
    private Global.Platform platform;
    private short server;
    private boolean adult;
    private int gold;
    private int loginTime;
    private Role role;

    public Account(Channel channel) {
        this.channel = channel;
    }

    public Channel getChannel() {
        return channel;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public int getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(int loginTime) {
        this.loginTime = loginTime;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr;
    }

    public Global.Platform getPlatform() {
        return platform;
    }

    public void setPlatform(Global.Platform platform) {
        this.platform = platform;
    }

    public short getServer() {
        return server;
    }

    public void setServer(short server) {
        this.server = server;
    }

    public boolean isAdult() {
        return adult;
    }

    public void setAdult(boolean adult) {
        this.adult = adult;
    }

    public int getGold() {
        return gold;
    }

    public void setGold(int gold) {
        this.gold = gold;
    }
}
