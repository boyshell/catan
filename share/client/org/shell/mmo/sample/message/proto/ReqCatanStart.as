package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.CatanMap;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReqCatanStart extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MAP:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanStart.map", "map", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanMap; });

		private var map$field:org.shell.mmo.sample.message.proto.CatanMap;

		public function clearMap():void {
			map$field = null;
		}

		public function get hasMap():Boolean {
			return map$field != null;
		}

		public function set map(value:org.shell.mmo.sample.message.proto.CatanMap):void {
			map$field = value;
		}

		public function get map():org.shell.mmo.sample.message.proto.CatanMap {
			return map$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, map$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var map$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (map$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanStart.map cannot be set twice.');
					}
					++map$count;
					this.map = new org.shell.mmo.sample.message.proto.CatanMap();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.map);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
