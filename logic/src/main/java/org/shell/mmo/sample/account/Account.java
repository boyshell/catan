package org.shell.mmo.sample.account;

import com.shell.mmo.utils.thread.Worker;
import io.netty.channel.Channel;
import org.shell.mmo.sample.role.Role;

/**
 * Created by zhangxiangxi on 16/7/22.
 */
public class Account extends com.shell.mmo.modules.account.Account {
    private int gold;
    private Role role;
    private Channel channel;
    private Worker worker;

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    public Worker getWorker() {
        return worker;
    }

    public void setWorker(Worker worker) {
        this.worker = worker;
    }

    public int getGold() {
        return gold;
    }

    public void setGold(int gold) {
        this.gold = gold;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
