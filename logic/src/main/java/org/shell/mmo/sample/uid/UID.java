package org.shell.mmo.sample.uid;

import com.shell.mmo.modules.uid.UIDService;

/**
 * Created by zhangxiangxi on 16/7/28.
 */
public enum  UID {
    ACCOUNT(true, true),

    ;
    private final UIDService.Type type;

    UID(boolean client, boolean strick) {
        this.type = new UIDService.Type(this.toString(), client, strick);
    }

    public UIDService.Type getType() {
        return type;
    }
}
