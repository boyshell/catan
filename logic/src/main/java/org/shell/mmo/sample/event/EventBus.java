package org.shell.mmo.sample.event;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import com.google.inject.Singleton;
import com.shell.mmo.utils.thread.DisruptorWorker;
import com.shell.mmo.utils.thread.Worker;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/**
 * Created by zhangxiangxi on 16/8/1.
 */
@Singleton
public class EventBus {
    private final Worker worker;
    private Multimap<Class<?>, Handler> handlers = HashMultimap.create();

    public EventBus() throws Exception {
        worker = new DisruptorWorker("event-bus", 16 * 1024, 1, Thread.MAX_PRIORITY);
    }

    public void register(Handler handler) {
        handlers.put(handler.type(), handler);
    }

    public void post(Object event) {
        worker.execute(() -> {
            for (Handler handler : handlers.get(event.getClass())) {
                handler.exec(event);
            }
        });
    }

    public abstract static class Handler<T> {
        protected abstract void exec(T t);
        public Class<T> type() {
            Type type = this.getClass().getGenericSuperclass();
            if (type instanceof ParameterizedType) {
                Type tType = ((ParameterizedType)type).getActualTypeArguments()[0];
                return (Class<T>) tType;
            } else {
                return null;
            }
        }
    }
}
