package org.shell.mmo.sample.account;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
public class LoginEvent {
    private final Account account;

    public LoginEvent(Account account) {
        this.account = account;
    }

    public Account getAccount() {
        return account;
    }
}
