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
	public dynamic final class ReqLoginLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USR:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("org.shell.mmo.sample.message.proto.ReqLoginLogin.usr", "usr", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var usr:String;

		/**
		 *  @private
		 */
		public static const PLATFORM:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqLoginLogin.platform", "platform", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var platform:int;

		/**
		 *  @private
		 */
		public static const SERVER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqLoginLogin.server", "server", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var server:int;

		/**
		 *  @private
		 */
		public static const ADULT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("org.shell.mmo.sample.message.proto.ReqLoginLogin.adult", "adult", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var adult:Boolean;

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqLoginLogin.time", "time", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var time:int;

		/**
		 *  @private
		 */
		public static const SIGN:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("org.shell.mmo.sample.message.proto.ReqLoginLogin.sign", "sign", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var sign:String;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, this.usr);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.platform);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.server);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, this.adult);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.time);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
			com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, this.sign);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var usr$count:uint = 0;
			var platform$count:uint = 0;
			var server$count:uint = 0;
			var adult$count:uint = 0;
			var time$count:uint = 0;
			var sign$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (usr$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLoginLogin.usr cannot be set twice.');
					}
					++usr$count;
					this.usr = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (platform$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLoginLogin.platform cannot be set twice.');
					}
					++platform$count;
					this.platform = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (server$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLoginLogin.server cannot be set twice.');
					}
					++server$count;
					this.server = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (adult$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLoginLogin.adult cannot be set twice.');
					}
					++adult$count;
					this.adult = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 5:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLoginLogin.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (sign$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqLoginLogin.sign cannot be set twice.');
					}
					++sign$count;
					this.sign = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
