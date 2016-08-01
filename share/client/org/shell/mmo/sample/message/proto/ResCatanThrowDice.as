package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.Error;
	import org.shell.mmo.sample.message.proto.CatanMasterResource;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ResCatanThrowDice extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ERROR:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResCatanThrowDice.error", "error", (1 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.Error);

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
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResCatanThrowDice.id", "id", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const DICE1:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ResCatanThrowDice.dice1", "dice1", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dice1$field:int;

		public function clearDice1():void {
			hasField$0 &= 0xfffffffd;
			dice1$field = new int();
		}

		public function get hasDice1():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set dice1(value:int):void {
			hasField$0 |= 0x2;
			dice1$field = value;
		}

		public function get dice1():int {
			return dice1$field;
		}

		/**
		 *  @private
		 */
		public static const DICE2:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ResCatanThrowDice.dice2", "dice2", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dice2$field:int;

		public function clearDice2():void {
			hasField$0 &= 0xfffffffb;
			dice2$field = new int();
		}

		public function get hasDice2():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set dice2(value:int):void {
			hasField$0 |= 0x4;
			dice2$field = value;
		}

		public function get dice2():int {
			return dice2$field;
		}

		/**
		 *  @private
		 */
		public static const OBTAIN:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanThrowDice.obtain", "obtain", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanMasterResource; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanMasterResource")]
		public var obtain:Array = [];

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
			if (hasDice1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dice1$field);
			}
			if (hasDice2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dice2$field);
			}
			for (var obtain$index:uint = 0; obtain$index < this.obtain.length; ++obtain$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.obtain[obtain$index]);
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
			var dice1$count:uint = 0;
			var dice2$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanThrowDice.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanThrowDice.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 3:
					if (dice1$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanThrowDice.dice1 cannot be set twice.');
					}
					++dice1$count;
					this.dice1 = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (dice2$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanThrowDice.dice2 cannot be set twice.');
					}
					++dice2$count;
					this.dice2 = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					this.obtain.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanMasterResource()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
