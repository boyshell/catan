package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.CatanCountry;
	import org.shell.mmo.sample.message.proto.CatanGrid;
	import org.shell.mmo.sample.message.proto.CatanPort;
	import org.shell.mmo.sample.message.proto.CatanRoad;
	import org.shell.mmo.sample.message.proto.CatanCity;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CatanMap extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GRID:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanMap.grid", "grid", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanGrid; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanGrid")]
		public var grid:Array = [];

		/**
		 *  @private
		 */
		public static const CITY:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanMap.city", "city", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanCity; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanCity")]
		public var city:Array = [];

		/**
		 *  @private
		 */
		public static const COUNTRY:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanMap.country", "country", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanCountry; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanCountry")]
		public var country:Array = [];

		/**
		 *  @private
		 */
		public static const ROAD:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanMap.road", "road", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanRoad; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanRoad")]
		public var road:Array = [];

		/**
		 *  @private
		 */
		public static const PORT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.CatanMap.port", "port", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanPort; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanPort")]
		public var port:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var grid$index:uint = 0; grid$index < this.grid.length; ++grid$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.grid[grid$index]);
			}
			for (var city$index:uint = 0; city$index < this.city.length; ++city$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.city[city$index]);
			}
			for (var country$index:uint = 0; country$index < this.country.length; ++country$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.country[country$index]);
			}
			for (var road$index:uint = 0; road$index < this.road.length; ++road$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.road[road$index]);
			}
			for (var port$index:uint = 0; port$index < this.port.length; ++port$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.port[port$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.grid.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanGrid()));
					break;
				case 2:
					this.city.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanCity()));
					break;
				case 3:
					this.country.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanCountry()));
					break;
				case 4:
					this.road.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanRoad()));
					break;
				case 5:
					this.port.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanPort()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
