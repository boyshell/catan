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
	public dynamic final class GameTable extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.GameTable.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.GameTable.count", "count", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count$field:int;

		public function clearCount():void {
			hasField$0 &= 0xfffffffd;
			count$field = new int();
		}

		public function get hasCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set count(value:int):void {
			hasField$0 |= 0x2;
			count$field = value;
		}

		public function get count():int {
			return count$field;
		}

		/**
		 *  @private
		 */
		public static const PWD:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("org.shell.mmo.sample.message.proto.GameTable.pwd", "pwd", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pwd$field:Boolean;

		public function clearPwd():void {
			hasField$0 &= 0xfffffffb;
			pwd$field = new Boolean();
		}

		public function get hasPwd():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set pwd(value:Boolean):void {
			hasField$0 |= 0x4;
			pwd$field = value;
		}

		public function get pwd():Boolean {
			return pwd$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("org.shell.mmo.sample.message.proto.GameTable.name", "name", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const START:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("org.shell.mmo.sample.message.proto.GameTable.start", "start", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start$field:Boolean;

		public function clearStart():void {
			hasField$0 &= 0xfffffff7;
			start$field = new Boolean();
		}

		public function get hasStart():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set start(value:Boolean):void {
			hasField$0 |= 0x8;
			start$field = value;
		}

		public function get start():Boolean {
			return start$field;
		}

		/**
		 *  @private
		 */
		public static const MAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.GameTable.max", "max", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max$field:int;

		public function clearMax():void {
			hasField$0 &= 0xffffffef;
			max$field = new int();
		}

		public function get hasMax():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set max(value:int):void {
			hasField$0 |= 0x10;
			max$field = value;
		}

		public function get max():int {
			return max$field;
		}

		/**
		 *  @private
		 */
		public static const MAP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.GameTable.map", "map", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var map$field:int;

		public function clearMap():void {
			hasField$0 &= 0xffffffdf;
			map$field = new int();
		}

		public function get hasMap():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set map(value:int):void {
			hasField$0 |= 0x20;
			map$field = value;
		}

		public function get map():int {
			return map$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, count$field);
			}
			if (hasPwd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, pwd$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, start$field);
			}
			if (hasMax) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, max$field);
			}
			if (hasMap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, map$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var count$count:uint = 0;
			var pwd$count:uint = 0;
			var name$count:uint = 0;
			var start$count:uint = 0;
			var max$count:uint = 0;
			var map$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GameTable.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GameTable.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (pwd$count != 0) {
						throw new flash.errors.IOError('Bad data format: GameTable.pwd cannot be set twice.');
					}
					++pwd$count;
					this.pwd = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: GameTable.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (start$count != 0) {
						throw new flash.errors.IOError('Bad data format: GameTable.start cannot be set twice.');
					}
					++start$count;
					this.start = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 6:
					if (max$count != 0) {
						throw new flash.errors.IOError('Bad data format: GameTable.max cannot be set twice.');
					}
					++max$count;
					this.max = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (map$count != 0) {
						throw new flash.errors.IOError('Bad data format: GameTable.map cannot be set twice.');
					}
					++map$count;
					this.map = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
