package org.shell.mmo.sample.room;

import com.google.protobuf.MessageLite;
import org.shell.mmo.sample.message.MessageHandler;

public abstract class RoomMessageHandler<T extends MessageLite> extends MessageHandler<T> {
}