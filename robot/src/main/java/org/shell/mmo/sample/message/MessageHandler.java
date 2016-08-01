package org.shell.mmo.sample.message;

import com.google.inject.Inject;
import com.google.protobuf.MessageLite;
import com.google.protobuf.MessageLiteOrBuilder;
import com.shell.mmo.utils.thread.Worker;
import org.shell.mmo.sample.account.Account;
import org.shell.mmo.sample.account.AccountService;
import org.shell.mmo.sample.message.proto.Global;

/**
 * Created by zhangxiangxi on 16/7/20.
 */
public abstract class MessageHandler<K extends MessageLite> extends com.shell.mmo.utils.net.message.MessageHandler<K> {
    public abstract Global.Module module();
    public MessageLiteOrBuilder error(Global.Error error) { return null; }

    @Inject
    AccountService accountService;

    protected Account account;

    @Override
    protected Worker worker() {
        account = (Account) channel.attr(ChannelAttributeKey.ACCOUNT.getKey()).get();
        return accountService.worker(account);
    }

    @Override
    protected boolean filter() {
        return false;
    }

    @Override
    protected void rescue() {
    }
}