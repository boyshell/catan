package org.shell.mmo.sample.uid;

import com.shell.mmo.modules.uid.UIDService;

import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by zhangxiangxi on 16/7/28.
 */
public class UIDSaver implements UIDService.Saver {
    @Override
    public void insertAsync(byte b, short i, String s, long l) {
        // TODO
    }

    @Override
    public void updateAsync(byte b, short i, String s, long l) {
        // TODO
    }

    @Override
    public void updateSync(byte b, short i, String s, long l) {
        // TODO
    }

    @Override
    public Collection<Bean> loadSync() {
        // TODO
        return new ArrayList<>();
    }
}
