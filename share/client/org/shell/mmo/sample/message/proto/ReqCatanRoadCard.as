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
	public dynamic final class ReqCatanRoadCard extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SRC1:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanRoadCard.src1", "src1", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

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
		public static const DST1:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanRoadCard.dst1", "dst1", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

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
		public static const SRC2:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanRoadCard.src2", "src2", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

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
		public static const DST2:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanRoadCard.dst2", "dst2", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSrc1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, src1$field);
			}
			if (hasDst1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, dst1$field);
			}
			if (hasSrc2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, src2$field);
			}
			if (hasDst2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, dst2$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var src1$count:uint = 0;
			var dst1$count:uint = 0;
			var src2$count:uint = 0;
			var dst2$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (src1$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoadCard.src1 cannot be set twice.');
					}
					++src1$count;
					this.src1 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.src1);
					break;
				case 2:
					if (dst1$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoadCard.dst1 cannot be set twice.');
					}
					++dst1$count;
					this.dst1 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.dst1);
					break;
				case 3:
					if (src2$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoadCard.src2 cannot be set twice.');
					}
					++src2$count;
					this.src2 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.src2);
					break;
				case 4:
					if (dst2$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoadCard.dst2 cannot be set twice.');
					}
					++dst2$count;
					this.dst2 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.dst2);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
