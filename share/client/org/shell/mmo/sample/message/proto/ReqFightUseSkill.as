package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.GameObjectType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReqFightUseSkill extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TARGET:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ReqFightUseSkill.target", "target", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var target$field:UInt64;

		public function clearTarget():void {
			target$field = null;
		}

		public function get hasTarget():Boolean {
			return target$field != null;
		}

		public function set target(value:UInt64):void {
			target$field = value;
		}

		public function get target():UInt64 {
			return target$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ReqFightUseSkill.type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.GameObjectType);

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
		public static const SKILL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqFightUseSkill.skill", "skill", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill$field:int;

		public function clearSkill():void {
			hasField$0 &= 0xfffffffd;
			skill$field = new int();
		}

		public function get hasSkill():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set skill(value:int):void {
			hasField$0 |= 0x2;
			skill$field = value;
		}

		public function get skill():int {
			return skill$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTarget) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, target$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, type$field);
			}
			if (hasSkill) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, skill$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var target$count:uint = 0;
			var type$count:uint = 0;
			var skill$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (target$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqFightUseSkill.target cannot be set twice.');
					}
					++target$count;
					this.target = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 2:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqFightUseSkill.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 3:
					if (skill$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqFightUseSkill.skill cannot be set twice.');
					}
					++skill$count;
					this.skill = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
