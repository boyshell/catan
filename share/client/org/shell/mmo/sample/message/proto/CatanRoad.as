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
	public dynamic final class CatanRoad extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POINT1:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanRoad.point1", "point1", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var point1$field:org.shell.mmo.sample.message.proto.Position;

		public function clearPoint1():void {
			point1$field = null;
		}

		public function get hasPoint1():Boolean {
			return point1$field != null;
		}

		public function set point1(value:org.shell.mmo.sample.message.proto.Position):void {
			point1$field = value;
		}

		public function get point1():org.shell.mmo.sample.message.proto.Position {
			return point1$field;
		}

		/**
		 *  @private
		 */
		public static const POINT2:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanRoad.point2", "point2", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var point2$field:org.shell.mmo.sample.message.proto.Position;

		public function clearPoint2():void {
			point2$field = null;
		}

		public function get hasPoint2():Boolean {
			return point2$field != null;
		}

		public function set point2(value:org.shell.mmo.sample.message.proto.Position):void {
			point2$field = value;
		}

		public function get point2():org.shell.mmo.sample.message.proto.Position {
			return point2$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.CatanRoad.id", "id", (3 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
			if (hasPoint1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, point1$field);
			}
			if (hasPoint2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, point2$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 3);
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
			var point1$count:uint = 0;
			var point2$count:uint = 0;
			var id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (point1$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanRoad.point1 cannot be set twice.');
					}
					++point1$count;
					this.point1 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.point1);
					break;
				case 2:
					if (point2$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanRoad.point2 cannot be set twice.');
					}
					++point2$count;
					this.point2 = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.point2);
					break;
				case 3:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanRoad.id cannot be set twice.');
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
