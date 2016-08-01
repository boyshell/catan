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
	public dynamic final class ReqCatanRoundStart extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ReqCatanRoundStart.id", "id", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const REMAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqCatanRoundStart.remain", "remain", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var remain$field:int;

		private var hasField$0:uint = 0;

		public function clearRemain():void {
			hasField$0 &= 0xfffffffe;
			remain$field = new int();
		}

		public function get hasRemain():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set remain(value:int):void {
			hasField$0 |= 0x1;
			remain$field = value;
		}

		public function get remain():int {
			return remain$field;
		}

		/**
		 *  @private
		 */
		public static const DICE1:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqCatanRoundStart.dice1", "dice1", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, id$field);
			}
			if (hasRemain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, remain$field);
			}
			if (hasDice1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dice1$field);
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
			var remain$count:uint = 0;
			var dice1$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoundStart.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 2:
					if (remain$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoundStart.remain cannot be set twice.');
					}
					++remain$count;
					this.remain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (dice1$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoundStart.dice1 cannot be set twice.');
					}
					++dice1$count;
					this.dice1 = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
