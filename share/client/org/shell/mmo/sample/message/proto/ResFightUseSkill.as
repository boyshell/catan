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

		public var error:int;

		/**
		 *  @private
		 */
		public static const TARGET:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResFightUseSkill.target", "target", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		public var target:UInt64;

		/**
		 *  @private
		 */
		public static const TARGETTYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResFightUseSkill.targetType", "targetType", (3 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.GameObjectType);

		public var targetType:int;

		/**
		 *  @private
		 */
		public static const SKILL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ResFightUseSkill.skill", "skill", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var skill:int;

		/**
		 *  @private
		 */
		public static const USER:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResFightUseSkill.user", "user", (5 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		public var user:UInt64;

		/**
		 *  @private
		 */
		public static const USERTYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResFightUseSkill.userType", "userType", (6 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.GameObjectType);

		public var userType:int;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.error);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
			com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, this.target);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.targetType);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.skill);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 5);
			com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, this.user);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.userType);
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
