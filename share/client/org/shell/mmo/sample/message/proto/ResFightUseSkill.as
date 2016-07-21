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
	import org.shell.mmo.sample.message.proto.Error;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ResFightUseSkill extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ERROR:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResFightUseSkill.error", "error", (1 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.Error);

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
		public static const TARGET:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResFightUseSkill.target", "target", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const TARGETTYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResFightUseSkill.targetType", "targetType", (3 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.GameObjectType);

		private var targetType$field:int;

		public function clearTargetType():void {
			hasField$0 &= 0xfffffffd;
			targetType$field = new int();
		}

		public function get hasTargetType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set targetType(value:int):void {
			hasField$0 |= 0x2;
			targetType$field = value;
		}

		public function get targetType():int {
			return targetType$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ResFightUseSkill.skill", "skill", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill$field:int;

		public function clearSkill():void {
			hasField$0 &= 0xfffffffb;
			skill$field = new int();
		}

		public function get hasSkill():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set skill(value:int):void {
			hasField$0 |= 0x4;
			skill$field = value;
		}

		public function get skill():int {
			return skill$field;
		}

		/**
		 *  @private
		 */
		public static const USER:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResFightUseSkill.user", "user", (5 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var user$field:UInt64;

		public function clearUser():void {
			user$field = null;
		}

		public function get hasUser():Boolean {
			return user$field != null;
		}

		public function set user(value:UInt64):void {
			user$field = value;
		}

		public function get user():UInt64 {
			return user$field;
		}

		/**
		 *  @private
		 */
		public static const USERTYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResFightUseSkill.userType", "userType", (6 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.GameObjectType);

		private var userType$field:int;

		public function clearUserType():void {
			hasField$0 &= 0xfffffff7;
			userType$field = new int();
		}

		public function get hasUserType():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set userType(value:int):void {
			hasField$0 |= 0x8;
			userType$field = value;
		}

		public function get userType():int {
			return userType$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasError) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, error$field);
			}
			if (hasTarget) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, target$field);
			}
			if (hasTargetType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, targetType$field);
			}
			if (hasSkill) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, skill$field);
			}
			if (hasUser) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, user$field);
			}
			if (hasUserType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, userType$field);
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
			var target$count:uint = 0;
			var targetType$count:uint = 0;
			var skill$count:uint = 0;
			var user$count:uint = 0;
			var userType$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResFightUseSkill.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (target$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResFightUseSkill.target cannot be set twice.');
					}
					++target$count;
					this.target = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 3:
					if (targetType$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResFightUseSkill.targetType cannot be set twice.');
					}
					++targetType$count;
					this.targetType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 4:
					if (skill$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResFightUseSkill.skill cannot be set twice.');
					}
					++skill$count;
					this.skill = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (user$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResFightUseSkill.user cannot be set twice.');
					}
					++user$count;
					this.user = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 6:
					if (userType$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResFightUseSkill.userType cannot be set twice.');
					}
					++userType$count;
					this.userType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
