package org.shell.mmo.sample.scene;

import io.netty.channel.Channel;

/**
 * Created by zhangxiangxi on 16/7/22.
 */
public class RoleScene {
    private int id;
    private Channel channel;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public synchronized Channel getChannel() {
        return channel;
    }

    public synchronized void setChannel(Channel channel) {
        this.channel = channel;
    }
}
