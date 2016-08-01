package org.shell.mmo.sample.account;

import com.google.inject.Singleton;
import com.shell.mmo.utils.HashUtil;
import com.shell.mmo.utils.thread.DisruptorWorker;
import com.shell.mmo.utils.thread.Worker;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
@Singleton
public class AccountService {
    private final Worker[] workers;

    public AccountService() throws Exception {
        workers = DisruptorWorker.createGroup("account-worker", 16 * 1024, Thread.MAX_PRIORITY, Runtime.getRuntime().availableProcessors());
    }

    public Worker worker(Account account) {
        return HashUtil.object(workers, account.getUsr().hashCode());
    }
}
