package org.shell.mmo.sample.message;

import io.netty.util.AttributeKey;

/**
 * Created by zhangxiangxi on 16/7/22.
 */
public enum  ChannelAttributeKey {
    ACCOUNT,
    ;
    private AttributeKey key;

    ChannelAttributeKey() {
        this.key = AttributeKey.newInstance(this.name());
    }

    public AttributeKey getKey() {
        return key;
    }
}
