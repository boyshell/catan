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
	public dynamic final class ReqCatanBuildRoad extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SRC:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanBuildRoad.src", "src", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var src$field:org.shell.mmo.sample.message.proto.Position;

		public function clearSrc():void {
			src$field = null;
		}

		public function get hasSrc():Boolean {
			return src$field != null;
		}

		public function set src(value:org.shell.mmo.sample.message.proto.Position):void {
			src$field = value;
		}

		public function get src():org.shell.mmo.sample.message.proto.Position {
			return src$field;
		}

		/**
		 *  @private
		 */
		public static const DST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanBuildRoad.dst", "dst", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var dst$field:org.shell.mmo.sample.message.proto.Position;

		public function clearDst():void {
			dst$field = null;
		}

		public function get hasDst():Boolean {
			return dst$field != null;
		}

		public function set dst(value:org.shell.mmo.sample.message.proto.Position):void {
			dst$field = value;
		}

		public function get dst():org.shell.mmo.sample.message.proto.Position {
			return dst$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSrc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, src$field);
			}
			if (hasDst) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, dst$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var src$count:uint = 0;
			var dst$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (src$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanBuildRoad.src cannot be set twice.');
					}
					++src$count;
					this.src = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.src);
					break;
				case 2:
					if (dst$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanBuildRoad.dst cannot be set twice.');
					}
					++dst$count;
					this.dst = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.dst);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
