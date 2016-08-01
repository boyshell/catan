package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.CatanMasterResource;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReqCatanRoundCommonStart extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ReqCatanRoundCommonStart.id", "id", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const REMAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqCatanRoundCommonStart.remain", "remain", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ROB:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("org.shell.mmo.sample.message.proto.ReqCatanRoundCommonStart.rob", "rob", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rob$field:Boolean;

		public function clearRob():void {
			hasField$0 &= 0xfffffffd;
			rob$field = new Boolean();
		}

		public function get hasRob():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set rob(value:Boolean):void {
			hasField$0 |= 0x2;
			rob$field = value;
		}

		public function get rob():Boolean {
			return rob$field;
		}

		/**
		 *  @private
		 */
		public static const GAIN:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanRoundCommonStart.gain", "gain", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanMasterResource; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanMasterResource")]
		public var gain:Array = [];

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
			if (hasRob) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, rob$field);
			}
			for (var gain$index:uint = 0; gain$index < this.gain.length; ++gain$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.gain[gain$index]);
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
			var rob$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoundCommonStart.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 2:
					if (remain$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoundCommonStart.remain cannot be set twice.');
					}
					++remain$count;
					this.remain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (rob$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanRoundCommonStart.rob cannot be set twice.');
					}
					++rob$count;
					this.rob = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					this.gain.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanMasterResource()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
