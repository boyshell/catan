package org.shell.mmo.sample.executor;

import io.netty.channel.Channel;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;

/**
 * Created by zhangxiangxi on 16/7/21.
 */
public class Executors {
    private static ExecutorService service = java.util.concurrent.Executors.newSingleThreadExecutor();

    public static Executor worker(Channel channel) {
        return service;
    }
}
