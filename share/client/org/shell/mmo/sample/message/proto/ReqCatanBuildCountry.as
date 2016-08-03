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
	public dynamic final class ReqCatanBuildCountry extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanBuildCountry.country", "country", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var country$field:org.shell.mmo.sample.message.proto.Position;

		public function clearCountry():void {
			country$field = null;
		}

		public function get hasCountry():Boolean {
			return country$field != null;
		}

		public function set country(value:org.shell.mmo.sample.message.proto.Position):void {
			country$field = value;
		}

		public function get country():org.shell.mmo.sample.message.proto.Position {
			return country$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, country$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanBuildCountry.country cannot be set twice.');
					}
					++country$count;
					this.country = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.country);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
