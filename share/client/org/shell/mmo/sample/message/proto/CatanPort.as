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
	import org.shell.mmo.sample.message.proto.CatanPortType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CatanPort extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POSITION1:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanPort.position1", "position1", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var position1$field:org.shell.mmo.sample.message.proto.Position;

		public function clearPosition1():void {
			position1$field = null;
		}

		public function get hasPosition1():Boolean {
			return position1$field != null;
		}

		public function set position1(value:org.shell.mmo.sample.message.proto.Position):void {
			position1$field = value;
		}

		public function get position1():org.shell.mmo.sample.message.proto.Position {
			return position1$field;
		}

		/**
		 *  @private
		 */
		public static const POSITION2:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanPort.position2", "position2", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var position2$field:org.shell.mmo.sample.message.proto.Position;

		public function clearPosition2():void {
			position2$field = null;
		}

		public function get hasPosition2():Boolean {
			return position2$field != null;
		}

		public function set position2(value:org.shell.mmo.sample.message.proto.Position):void {
			position2$field = value;
		}

		public function get position2():org.shell.mmo.sample.message.proto.Position {
			return position2$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.CatanPort.type", "type", (3 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.CatanPortType);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPosition1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, position1$field);
			}
			if (hasPosition2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, position2$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var position1$count:uint = 0;
			var position2$count:uint = 0;
			var type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (position1$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanPort.position1 cannot be set twice.');
					}
					++position1$count;
					this.position1 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.position1);
					break;
				case 2:
					if (position2$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanPort.position2 cannot be set twice.');
					}
					++position2$count;
					this.position2 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.position2);
					break;
				case 3:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanPort.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
