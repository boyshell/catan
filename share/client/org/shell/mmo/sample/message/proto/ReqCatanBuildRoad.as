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
	public dynamic final class ReqCatanBuildRoad extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROAD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqCatanBuildRoad.road", "road", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var road$field:int;

		private var hasField$0:uint = 0;

		public function clearRoad():void {
			hasField$0 &= 0xfffffffe;
			road$field = new int();
		}

		public function get hasRoad():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set road(value:int):void {
			hasField$0 |= 0x1;
			road$field = value;
		}

		public function get road():int {
			return road$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoad) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, road$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var road$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (road$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanBuildRoad.road cannot be set twice.');
					}
					++road$count;
					this.road = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
