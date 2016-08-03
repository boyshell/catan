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
	public dynamic final class ResCatanRoadCard extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ERROR:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResCatanRoadCard.error", "error", (1 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.Error);

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
		public static const SRC1:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanRoadCard.src1", "src1", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var src1$field:org.shell.mmo.sample.message.proto.Position;

		public function clearSrc1():void {
			src1$field = null;
		}

		public function get hasSrc1():Boolean {
			return src1$field != null;
		}

		public function set src1(value:org.shell.mmo.sample.message.proto.Position):void {
			src1$field = value;
		}

		public function get src1():org.shell.mmo.sample.message.proto.Position {
			return src1$field;
		}

		/**
		 *  @private
		 */
		public static const DST1:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanRoadCard.dst1", "dst1", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var dst1$field:org.shell.mmo.sample.message.proto.Position;

		public function clearDst1():void {
			dst1$field = null;
		}

		public function get hasDst1():Boolean {
			return dst1$field != null;
		}

		public function set dst1(value:org.shell.mmo.sample.message.proto.Position):void {
			dst1$field = value;
		}

		public function get dst1():org.shell.mmo.sample.message.proto.Position {
			return dst1$field;
		}

		/**
		 *  @private
		 */
		public static const SRC2:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanRoadCard.src2", "src2", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var src2$field:org.shell.mmo.sample.message.proto.Position;

		public function clearSrc2():void {
			src2$field = null;
		}

		public function get hasSrc2():Boolean {
			return src2$field != null;
		}

		public function set src2(value:org.shell.mmo.sample.message.proto.Position):void {
			src2$field = value;
		}

		public function get src2():org.shell.mmo.sample.message.proto.Position {
			return src2$field;
		}

		/**
		 *  @private
		 */
		public static const DST2:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanRoadCard.dst2", "dst2", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var dst2$field:org.shell.mmo.sample.message.proto.Position;

		public function clearDst2():void {
			dst2$field = null;
		}

		public function get hasDst2():Boolean {
			return dst2$field != null;
		}

		public function set dst2(value:org.shell.mmo.sample.message.proto.Position):void {
			dst2$field = value;
		}

		public function get dst2():org.shell.mmo.sample.message.proto.Position {
			return dst2$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResCatanRoadCard.id", "id", (6 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasError) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, error$field);
			}
			if (hasSrc1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, src1$field);
			}
			if (hasDst1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, dst1$field);
			}
			if (hasSrc2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, src2$field);
			}
			if (hasDst2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, dst2$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, id$field);
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
			var src1$count:uint = 0;
			var dst1$count:uint = 0;
			var src2$count:uint = 0;
			var dst2$count:uint = 0;
			var id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRoadCard.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (src1$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRoadCard.src1 cannot be set twice.');
					}
					++src1$count;
					this.src1 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.src1);
					break;
				case 3:
					if (dst1$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRoadCard.dst1 cannot be set twice.');
					}
					++dst1$count;
					this.dst1 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.dst1);
					break;
				case 4:
					if (src2$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRoadCard.src2 cannot be set twice.');
					}
					++src2$count;
					this.src2 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.src2);
					break;
				case 5:
					if (dst2$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRoadCard.dst2 cannot be set twice.');
					}
					++dst2$count;
					this.dst2 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.dst2);
					break;
				case 6:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRoadCard.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
