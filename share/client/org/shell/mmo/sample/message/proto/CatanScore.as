package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CatanScore extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SCORE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.CatanScore.score", "score", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var score$field:int;

		private var hasField$0:uint = 0;

		public function clearScore():void {
			hasField$0 &= 0xfffffffe;
			score$field = new int();
		}

		public function get hasScore():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set score(value:int):void {
			hasField$0 |= 0x1;
			score$field = value;
		}

		public function get score():int {
			return score$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.CatanScore.id", "id", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const KNIGHT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.CatanScore.knight", "knight", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var knight$field:int;

		public function clearKnight():void {
			hasField$0 &= 0xfffffffd;
			knight$field = new int();
		}

		public function get hasKnight():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set knight(value:int):void {
			hasField$0 |= 0x2;
			knight$field = value;
		}

		public function get knight():int {
			return knight$field;
		}

		/**
		 *  @private
		 */
		public static const ROAD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.CatanScore.road", "road", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var road$field:int;

		public function clearRoad():void {
			hasField$0 &= 0xfffffffb;
			road$field = new int();
		}

		public function get hasRoad():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set road(value:int):void {
			hasField$0 |= 0x4;
			road$field = value;
		}

		public function get road():int {
			return road$field;
		}

		/**
		 *  @private
		 */
		public static const POINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.CatanScore.point", "point", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var point$field:int;

		public function clearPoint():void {
			hasField$0 &= 0xfffffff7;
			point$field = new int();
		}

		public function get hasPoint():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set point(value:int):void {
			hasField$0 |= 0x8;
			point$field = value;
		}

		public function get point():int {
			return point$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, score$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, id$field);
			}
			if (hasKnight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, knight$field);
			}
			if (hasRoad) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, road$field);
			}
			if (hasPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, point$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var score$count:uint = 0;
			var id$count:uint = 0;
			var knight$count:uint = 0;
			var road$count:uint = 0;
			var point$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (score$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanScore.score cannot be set twice.');
					}
					++score$count;
					this.score = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanScore.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 3:
					if (knight$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanScore.knight cannot be set twice.');
					}
					++knight$count;
					this.knight = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (road$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanScore.road cannot be set twice.');
					}
					++road$count;
					this.road = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (point$count != 0) {
						throw new flash.errors.IOError('Bad data format: CatanScore.point cannot be set twice.');
					}
					++point$count;
					this.point = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
