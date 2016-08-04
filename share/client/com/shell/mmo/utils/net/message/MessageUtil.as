/**
 * Created by zhangxiangxi on 16/8/4.
 */
package com.shell.mmo.utils.net.message {
import com.netease.protobuf.Message;
import com.netease.protobuf.ReadUtils;

import flash.utils.ByteArray;
import flash.utils.Dictionary;

public class MessageUtil {
    private var _id2message:Dictionary;
    private var _message2id:Dictionary;
    public function MessageUtil(_id2message:Dictionary, _message2id:Dictionary) {
        this._id2message = _id2message;
        this._message2id = _message2id;
    }

    /**
     * 解包消息
     * @param buf 缓冲
     * @return com.netease.protobuf.Message列表
     */
    public function decode(buf:ByteArray):Array {
        var op:int = buf.position;

        var len:int = ReadUtils.read_TYPE_INT32(buf);
        if (op == buf.position) {
            return null;
        }

        if (len < 0) {
            throw new Error("negative length: " + len)
            return null;
        }
        if (len > buf.bytesAvailable) {
            buf.position = op;
            return null;
        } else {
            var listBuf:ByteArray = new ByteArray();
            buf.readBytes(listBuf, 0, len);
            return decode0(listBuf);
        }
    }

    private function decode0(listBuf:ByteArray):Array {
        var mList:ProtoMessageList = new ProtoMessageList();
        mList.mergeFrom(listBuf);
        var list:Array = new Array();
        for each(var msg:ProtoMessage in mList.message) {
            list.push(decode1(msg));
        }
        return list;
    }

    private function decode1(dmsg:ProtoMessage):Message {
        var message:Message = new this._id2message[dmsg.id]() as Message;
        message.mergeFrom(dmsg.data);
        return message;
    }

    /**
     * 打包消息
     * @param msg 消息
     * @return 缓冲
     */
    public function encode(msg:Message, buf:ByteArray):void {
        var mList:ProtoMessageList = new ProtoMessageList();
        mList.message.push(encode0(msg))
        mList.writeTo(buf);
    }

    private function encode0(msg:Message):ProtoMessage {
        var pMsg:ProtoMessage = new ProtoMessage();
        pMsg.id = this._message2id[typeof msg];
        msg.writeTo(pMsg.data);
        return pMsg;
    }
}
}
