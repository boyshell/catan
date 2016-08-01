package org.shell.mmo.sample.account;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
public class RoleLoginEvent {
    private final Account account;

    public RoleLoginEvent(Account account) {
        this.account = account;
    }

    public Account getAccount() {
        return account;
    }
}
