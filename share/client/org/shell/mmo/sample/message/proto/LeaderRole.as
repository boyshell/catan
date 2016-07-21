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
	public dynamic final class LeaderRole extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.LeaderRole.id", "id", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("org.shell.mmo.sample.message.proto.LeaderRole.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const MAP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.LeaderRole.map", "map", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var map$field:int;

		private var hasField$0:uint = 0;

		public function clearMap():void {
			hasField$0 &= 0xfffffffe;
			map$field = new int();
		}

		public function get hasMap():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set map(value:int):void {
			hasField$0 |= 0x1;
			map$field = value;
		}

		public function get map():int {
			return map$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.LeaderRole.level", "level", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const SERVER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.LeaderRole.server", "server", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var server$field:int;

		public function clearServer():void {
			hasField$0 &= 0xfffffffb;
			server$field = new int();
		}

		public function get hasServer():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set server(value:int):void {
			hasField$0 |= 0x4;
			server$field = value;
		}

		public function get server():int {
			return server$field;
		}

		/**
		 *  @private
		 */
		public static const PLATFORM:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.LeaderRole.platform", "platform", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var platform$field:int;

		public function clearPlatform():void {
			hasField$0 &= 0xfffffff7;
			platform$field = new int();
		}

		public function get hasPlatform():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set platform(value:int):void {
			hasField$0 |= 0x8;
			platform$field = value;
		}

		public function get platform():int {
			return platform$field;
		}

		/**
		 *  @private
		 */
		public static const GOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.LeaderRole.gold", "gold", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gold$field:int;

		public function clearGold():void {
			hasField$0 &= 0xffffffef;
			gold$field = new int();
		}

		public function get hasGold():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set gold(value:int):void {
			hasField$0 |= 0x10;
			gold$field = value;
		}

		public function get gold():int {
			return gold$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasMap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, map$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasServer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, server$field);
			}
			if (hasPlatform) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, platform$field);
			}
			if (hasGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, gold$field);
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
			var name$count:uint = 0;
			var map$count:uint = 0;
			var level$count:uint = 0;
			var server$count:uint = 0;
			var platform$count:uint = 0;
			var gold$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaderRole.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaderRole.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (map$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaderRole.map cannot be set twice.');
					}
					++map$count;
					this.map = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaderRole.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (server$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaderRole.server cannot be set twice.');
					}
					++server$count;
					this.server = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (platform$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaderRole.platform cannot be set twice.');
					}
					++platform$count;
					this.platform = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaderRole.gold cannot be set twice.');
					}
					++gold$count;
					this.gold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
