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
	import org.shell.mmo.sample.message.proto.Error;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ResCatanBuildRoad extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ERROR:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResCatanBuildRoad.error", "error", (1 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.Error);

		private var error$field:int;

		private var hasField$0:uint = 0;

		public function clearError():void {
			hasField$0 &= 0xfffffffe;
			error$field = new int();
		}

		public function get hasError():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set error(value:int):void {
			hasField$0 |= 0x1;
			error$field = value;
		}

		public function get error():int {
			return error$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResCatanBuildRoad.id", "id", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var id$field:UInt64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:UInt64):void {
			id$field = value;
		}

		public function get id():UInt64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const SRC:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanBuildRoad.src", "src", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

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
		public static const DST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanBuildRoad.dst", "dst", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

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
			if (hasError) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, error$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, id$field);
			}
			if (hasSrc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, src$field);
			}
			if (hasDst) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
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
			var error$count:uint = 0;
			var id$count:uint = 0;
			var src$count:uint = 0;
			var dst$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanBuildRoad.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanBuildRoad.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 3:
					if (src$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanBuildRoad.src cannot be set twice.');
					}
					++src$count;
					this.src = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.src);
					break;
				case 4:
					if (dst$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanBuildRoad.dst cannot be set twice.');
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
