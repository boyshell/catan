package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.Position;
	import org.shell.mmo.sample.message.proto.CatanResource;
	import org.shell.mmo.sample.message.proto.Error;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ResCatanSet extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ERROR:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("org.shell.mmo.sample.message.proto.ResCatanSet.error", "error", (1 << 3) | com.netease.protobuf.WireType.VARINT, org.shell.mmo.sample.message.proto.Error);

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
		public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("org.shell.mmo.sample.message.proto.ResCatanSet.id", "id", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const COUNTRY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanSet.country", "country", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var country$field:org.shell.mmo.sample.message.proto.Position;

		public function clearCountry():void {
			country$field = null;
		}

		public function get hasCountry():Boolean {
			return country$field != null;
		}

		public function set country(value:org.shell.mmo.sample.message.proto.Position):void {
			country$field = value;
		}

		public function get country():org.shell.mmo.sample.message.proto.Position {
			return country$field;
		}

		/**
		 *  @private
		 */
		public static const ROADDST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanSet.roadDst", "roadDst", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.Position; });

		private var roadDst$field:org.shell.mmo.sample.message.proto.Position;

		public function clearRoadDst():void {
			roadDst$field = null;
		}

		public function get hasRoadDst():Boolean {
			return roadDst$field != null;
		}

		public function set roadDst(value:org.shell.mmo.sample.message.proto.Position):void {
			roadDst$field = value;
		}

		public function get roadDst():org.shell.mmo.sample.message.proto.Position {
			return roadDst$field;
		}

		/**
		 *  @private
		 */
		public static const RESOURCE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ResCatanSet.resource", "resource", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanResource; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanResource")]
		public var resource:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasError) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, error$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FIXED64(output, id$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, country$field);
			}
			if (hasRoadDst) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, roadDst$field);
			}
			for (var resource$index:uint = 0; resource$index < this.resource.length; ++resource$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.resource[resource$index]);
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
			var id$count:uint = 0;
			var country$count:uint = 0;
			var roadDst$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanSet.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanSet.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_FIXED64(input);
					break;
				case 3:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanSet.country cannot be set twice.');
					}
					++country$count;
					this.country = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.country);
					break;
				case 4:
					if (roadDst$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResCatanSet.roadDst cannot be set twice.');
					}
					++roadDst$count;
					this.roadDst = new org.shell.mmo.sample.message.proto.Position();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.roadDst);
					break;
				case 5:
					this.resource.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanResource()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
