package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReqCatanRoundFoldStart extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REMAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqCatanRoundFoldStart.remain", "remain", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var remain$field:int;

		private var hasField$0:uint = 0;

		public function clearRemain():void {
			hasField$0 &= 0xfffffffe;
			remain$field = new int();
		}

		public function get hasRemain():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set remain(value:int):void {
			hasField$0 |= 0x1;
			remain$field = value;
		}

		public function get remain():int {
			return remain$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRemain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, remain$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var remain$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (remain$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoundFoldStart.remain cannot be set twice.');
					}
					++remain$count;
					this.remain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
