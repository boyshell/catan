package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.CatanTableBrief;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReqCatanAddTable extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TABLE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanAddTable.table", "table", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanTableBrief; });

		private var table$field:org.shell.mmo.sample.message.proto.CatanTableBrief;

		public function clearTable():void {
			table$field = null;
		}

		public function get hasTable():Boolean {
			return table$field != null;
		}

		public function set table(value:org.shell.mmo.sample.message.proto.CatanTableBrief):void {
			table$field = value;
		}

		public function get table():org.shell.mmo.sample.message.proto.CatanTableBrief {
			return table$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, table$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var table$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (table$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanAddTable.table cannot be set twice.');
					}
					++table$count;
					this.table = new org.shell.mmo.sample.message.proto.CatanTableBrief();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.table);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
