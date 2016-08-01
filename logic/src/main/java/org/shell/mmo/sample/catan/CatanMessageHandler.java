package org.shell.mmo.sample.catan;

import com.google.protobuf.MessageLite;
import org.shell.mmo.sample.table.TableMessageHandler;

/**
 * 需要自行实现
 */
public abstract class CatanMessageHandler<T extends MessageLite> extends TableMessageHandler<T> {
}
