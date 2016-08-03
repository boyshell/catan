package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.Position;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReqCatanBuildCity extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CITY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanBuildCity.city", "city", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var city$field:org.shell.mmo.sample.message.proto.Position;

		public function clearCity():void {
			city$field = null;
		}

		public function get hasCity():Boolean {
			return city$field != null;
		}

		public function set city(value:org.shell.mmo.sample.message.proto.Position):void {
			city$field = value;
		}

		public function get city():org.shell.mmo.sample.message.proto.Position {
			return city$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCity) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, city$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var city$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (city$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanBuildCity.city cannot be set twice.');
					}
					++city$count;
					this.city = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.city);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
