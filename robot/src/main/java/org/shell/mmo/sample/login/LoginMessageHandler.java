package org.shell.mmo.sample.login;

import com.google.protobuf.MessageLite;
import org.shell.mmo.sample.message.MessageHandler;

/**
 * TODO 需要自行实现
 */
public abstract class LoginMessageHandler<T extends MessageLite> extends MessageHandler<T> {
}
