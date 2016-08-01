package org.shell.mmo.sample.role;

import com.google.inject.Inject;
import com.google.protobuf.MessageLite;
import com.shell.mmo.utils.thread.Worker;
import org.shell.mmo.sample.account.Account;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.login.LoginMessageHandler;
import org.shell.mmo.sample.message.ChannelAttributeKey;

/**
 * 需要自行实现
 */
public abstract class RoleMessageHandler<K extends MessageLite> extends LoginMessageHandler<K> {
    protected Account account;

    @Inject
    AccountService accountService;

    @Override
    protected Worker worker() {
        init();
        if (this.account == null) {
            return null;
        }
        return accountService.worker(account.getKey().getUsr());
    }

    protected void init() {
        synchronized (channel) {
            Object o = channel.attr(ChannelAttributeKey.ACCOUNT.getKey()).get();
            if (o == null) {
                return ;
            }
            this.account = (Account) o;
        }
    }
}
