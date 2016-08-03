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
	public dynamic final class ReqCatanSet extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanSet.country", "country", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

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
		public static const ROADDST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanSet.roadDst", "roadDst", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var roadDst$field:org.shell.mmo.sample.message.proto.Position;

		public function clearRoadDst():void {
			roadDst$field = null;
		}

		public function get hasRoadDst():Boolean {
			return roadDst$field != null;
		}

		public function set roadDst(value:org.shell.mmo.sample.message.proto.Position):void {
			roadDst$field = value;
		}

		public function get roadDst():org.shell.mmo.sample.message.proto.Position {
			return roadDst$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, country$field);
			}
			if (hasRoadDst) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, roadDst$field);
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
			var roadDst$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanSet.country cannot be set twice.');
					}
					++country$count;
					this.country = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.country);
					break;
				case 2:
					if (roadDst$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanSet.roadDst cannot be set twice.');
					}
					++roadDst$count;
					this.roadDst = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.roadDst);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
