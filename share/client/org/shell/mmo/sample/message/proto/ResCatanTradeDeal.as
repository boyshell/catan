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
	public dynamic final class ResCatanTradeDeal extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ERROR:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResCatanTradeDeal.error", "error", (1 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.Error);

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
		public static const MASTER1:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanTradeDeal.master1", "master1", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanMasterResource; });

		private var master1$field:org.shell.mmo.sample.message.proto.CatanMasterResource;

		public function clearMaster1():void {
			master1$field = null;
		}

		public function get hasMaster1():Boolean {
			return master1$field != null;
		}

		public function set master1(value:org.shell.mmo.sample.message.proto.CatanMasterResource):void {
			master1$field = value;
		}

		public function get master1():org.shell.mmo.sample.message.proto.CatanMasterResource {
			return master1$field;
		}

		/**
		 *  @private
		 */
		public static const MASTER2:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanTradeDeal.master2", "master2", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanMasterResource; });

		private var master2$field:org.shell.mmo.sample.message.proto.CatanMasterResource;

		public function clearMaster2():void {
			master2$field = null;
		}

		public function get hasMaster2():Boolean {
			return master2$field != null;
		}

		public function set master2(value:org.shell.mmo.sample.message.proto.CatanMasterResource):void {
			master2$field = value;
		}

		public function get master2():org.shell.mmo.sample.message.proto.CatanMasterResource {
			return master2$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasError) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, error$field);
			}
			if (hasMaster1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, master1$field);
			}
			if (hasMaster2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, master2$field);
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
			var master1$count:uint = 0;
			var master2$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanTradeDeal.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (master1$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanTradeDeal.master1 cannot be set twice.');
					}
					++master1$count;
					this.master1 = new org.shell.mmo.sample.message.proto.CatanMasterResource();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.master1);
					break;
				case 3:
					if (master2$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanTradeDeal.master2 cannot be set twice.');
					}
					++master2$count;
					this.master2 = new org.shell.mmo.sample.message.proto.CatanMasterResource();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.master2);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
