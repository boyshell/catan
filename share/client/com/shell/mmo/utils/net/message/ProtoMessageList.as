package com.shell.mmo.utils.net.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.shell.mmo.utils.net.message.ProtoMessage;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ProtoMessageList extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MESSAGE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("com.shell.mmo.utils.net.message.ProtoMessageList.message", "message", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.shell.mmo.utils.net.message.ProtoMessage; });

		[ArrayElementType("com.shell.mmo.utils.net.message.ProtoMessage")]
		public var message:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var message$index:uint = 0; message$index < this.message.length; ++message$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.message[message$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.message.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new com.shell.mmo.utils.net.message.ProtoMessage()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
