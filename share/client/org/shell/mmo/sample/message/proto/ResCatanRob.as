package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.CatanResource;
	import org.shell.mmo.sample.message.proto.Error;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ResCatanRob extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ERROR:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResCatanRob.error", "error", (1 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.Error);

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
		public static const ROBBER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ResCatanRob.robber", "robber", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var robber$field:int;

		public function clearRobber():void {
			hasField$0 &= 0xfffffffd;
			robber$field = new int();
		}

		public function get hasRobber():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set robber(value:int):void {
			hasField$0 |= 0x2;
			robber$field = value;
		}

		public function get robber():int {
			return robber$field;
		}

		/**
		 *  @private
		 */
		public static const CRIMINAL:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResCatanRob.criminal", "criminal", (3 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var criminal$field:UInt64;

		public function clearCriminal():void {
			criminal$field = null;
		}

		public function get hasCriminal():Boolean {
			return criminal$field != null;
		}

		public function set criminal(value:UInt64):void {
			criminal$field = value;
		}

		public function get criminal():UInt64 {
			return criminal$field;
		}

		/**
		 *  @private
		 */
		public static const VICTIM:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResCatanRob.victim", "victim", (4 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var victim$field:UInt64;

		public function clearVictim():void {
			victim$field = null;
		}

		public function get hasVictim():Boolean {
			return victim$field != null;
		}

		public function set victim(value:UInt64):void {
			victim$field = value;
		}

		public function get victim():UInt64 {
			return victim$field;
		}

		/**
		 *  @private
		 */
		public static const RESOURCE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanRob.resource", "resource", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanResource; });

		private var resource$field:org.shell.mmo.sample.message.proto.CatanResource;

		public function clearResource():void {
			resource$field = null;
		}

		public function get hasResource():Boolean {
			return resource$field != null;
		}

		public function set resource(value:org.shell.mmo.sample.message.proto.CatanResource):void {
			resource$field = value;
		}

		public function get resource():org.shell.mmo.sample.message.proto.CatanResource {
			return resource$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasError) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, error$field);
			}
			if (hasRobber) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, robber$field);
			}
			if (hasCriminal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, criminal$field);
			}
			if (hasVictim) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, victim$field);
			}
			if (hasResource) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, resource$field);
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
			var robber$count:uint = 0;
			var criminal$count:uint = 0;
			var victim$count:uint = 0;
			var resource$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRob.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (robber$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRob.robber cannot be set twice.');
					}
					++robber$count;
					this.robber = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (criminal$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRob.criminal cannot be set twice.');
					}
					++criminal$count;
					this.criminal = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 4:
					if (victim$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRob.victim cannot be set twice.');
					}
					++victim$count;
					this.victim = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 5:
					if (resource$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanRob.resource cannot be set twice.');
					}
					++resource$count;
					this.resource = new org.shell.mmo.sample.message.proto.CatanResource();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.resource);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
