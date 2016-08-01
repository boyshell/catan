package org.shell.mmo.sample.role;

import com.google.protobuf.MessageLite;
import org.shell.mmo.sample.message.MessageHandler;

/**
 * TODO 需要自行实现
 */
public abstract class RoleMessageHandler<T extends MessageLite> extends MessageHandler<T> {
}
