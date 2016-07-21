package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.Platform;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReqLoginLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USR:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("org.shell.mmo.sample.message.proto.ReqLoginLogin.usr", "usr", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var usr$field:String;

		public function clearUsr():void {
			usr$field = null;
		}

		public function get hasUsr():Boolean {
			return usr$field != null;
		}

		public function set usr(value:String):void {
			usr$field = value;
		}

		public function get usr():String {
			return usr$field;
		}

		/**
		 *  @private
		 */
		public static const PLATFORM:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ReqLoginLogin.platform", "platform", (2 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.Platform);

		private var platform$field:int;

		private var hasField$0:uint = 0;

		public function clearPlatform():void {
			hasField$0 &= 0xfffffffe;
			platform$field = new int();
		}

		public function get hasPlatform():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set platform(value:int):void {
			hasField$0 |= 0x1;
			platform$field = value;
		}

		public function get platform():int {
			return platform$field;
		}

		/**
		 *  @private
		 */
		public static const SERVER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqLoginLogin.server", "server", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var server$field:int;

		public function clearServer():void {
			hasField$0 &= 0xfffffffd;
			server$field = new int();
		}

		public function get hasServer():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set server(value:int):void {
			hasField$0 |= 0x2;
			server$field = value;
		}

		public function get server():int {
			return server$field;
		}

		/**
		 *  @private
		 */
		public static const ADULT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("org.shell.mmo.sample.message.proto.ReqLoginLogin.adult", "adult", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var adult$field:Boolean;

		public function clearAdult():void {
			hasField$0 &= 0xfffffffb;
			adult$field = new Boolean();
		}

		public function get hasAdult():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set adult(value:Boolean):void {
			hasField$0 |= 0x4;
			adult$field = value;
		}

		public function get adult():Boolean {
			return adult$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqLoginLogin.time", "time", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:int;

		public function clearTime():void {
			hasField$0 &= 0xfffffff7;
			time$field = new int();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set time(value:int):void {
			hasField$0 |= 0x8;
			time$field = value;
		}

		public function get time():int {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const SIGN:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("org.shell.mmo.sample.message.proto.ReqLoginLogin.sign", "sign", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sign$field:String;

		public function clearSign():void {
			sign$field = null;
		}

		public function get hasSign():Boolean {
			return sign$field != null;
		}

		public function set sign(value:String):void {
			sign$field = value;
		}

		public function get sign():String {
			return sign$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUsr) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, usr$field);
			}
			if (hasPlatform) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, platform$field);
			}
			if (hasServer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, server$field);
			}
			if (hasAdult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, adult$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, time$field);
			}
			if (hasSign) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, sign$field);
			}
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
					this.platform = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
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
