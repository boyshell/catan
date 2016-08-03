package org.shell.mmo.sample.config.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.config.proto.DcatanGrid;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CcatanMap extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var id:int;

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("org.shell.mmo.sample.config.proto.CcatanMap.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var name:String;

		/**
		 *  @private
		 */
		public static const MIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.min", "min", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var min:int;

		/**
		 *  @private
		 */
		public static const MAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.max", "max", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var max:int;

		/**
		 *  @private
		 */
		public static const GRID:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.config.proto.CcatanMap.grid", "grid", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.config.proto.DcatanGrid; });

		[ArrayElementType("org.shell.mmo.sample.config.proto.DcatanGrid")]
		public var grid:Array = [];

		/**
		 *  @private
		 */
		public static const NUMBER:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.number", "number", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var number:Array = [];

		/**
		 *  @private
		 */
		public static const BRICK:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.brick", "brick", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var brick:int;

		/**
		 *  @private
		 */
		public static const LUMBER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.lumber", "lumber", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		public var lumber:int;

		/**
		 *  @private
		 */
		public static const WOOL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.wool", "wool", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		public var wool:int;

		/**
		 *  @private
		 */
		public static const GAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.gain", "gain", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gain:int;

		/**
		 *  @private
		 */
		public static const ORE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.ore", "ore", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		public var ore:int;

		/**
		 *  @private
		 */
		public static const BRICKPORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.brickPort", "brickPort", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		public var brickPort:int;

		/**
		 *  @private
		 */
		public static const LUMBERPORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.lumberPort", "lumberPort", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		public var lumberPort:int;

		/**
		 *  @private
		 */
		public static const WOOLPORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.woolPort", "woolPort", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		public var woolPort:int;

		/**
		 *  @private
		 */
		public static const GAINPORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.gainPort", "gainPort", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gainPort:int;

		/**
		 *  @private
		 */
		public static const OREPORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.orePort", "orePort", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		public var orePort:int;

		/**
		 *  @private
		 */
		public static const BANKPORT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.bankPort", "bankPort", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		public var bankPort:int;

		/**
		 *  @private
		 */
		public static const BRICKMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.brickMax", "brickMax", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		public var brickMax:int;

		/**
		 *  @private
		 */
		public static const LUMBERMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.lumberMax", "lumberMax", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		public var lumberMax:int;

		/**
		 *  @private
		 */
		public static const WOOLMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.woolMax", "woolMax", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		public var woolMax:int;

		/**
		 *  @private
		 */
		public static const GAINMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.gainMax", "gainMax", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gainMax:int;

		/**
		 *  @private
		 */
		public static const OREMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.oreMax", "oreMax", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		public var oreMax:int;

		/**
		 *  @private
		 */
		public static const KNIGHTMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.knightMax", "knightMax", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		public var knightMax:int;

		/**
		 *  @private
		 */
		public static const MONOPOLYMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.monopolyMax", "monopolyMax", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		public var monopolyMax:int;

		/**
		 *  @private
		 */
		public static const RICHMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.richMax", "richMax", (25 << 3) | com.netease.protobuf.WireType.VARINT);

		public var richMax:int;

		/**
		 *  @private
		 */
		public static const ROADMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.roadMax", "roadMax", (26 << 3) | com.netease.protobuf.WireType.VARINT);

		public var roadMax:int;

		/**
		 *  @private
		 */
		public static const POINTMAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.config.proto.CcatanMap.pointMax", "pointMax", (27 << 3) | com.netease.protobuf.WireType.VARINT);

		public var pointMax:int;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.id);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, this.name);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.min);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.max);
			for (var grid$index:uint = 0; grid$index < this.grid.length; ++grid$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.grid[grid$index]);
			}
			for (var number$index:uint = 0; number$index < this.number.length; ++number$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.number[number$index]);
			}
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.brick);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.lumber);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.wool);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.gain);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.ore);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.brickPort);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.lumberPort);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.woolPort);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.gainPort);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.orePort);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.bankPort);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.brickMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.lumberMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.woolMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.gainMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.oreMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.knightMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.monopolyMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 25);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.richMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 26);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.roadMax);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 27);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.pointMax);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var min$count:uint = 0;
			var max$count:uint = 0;
			var brick$count:uint = 0;
			var lumber$count:uint = 0;
			var wool$count:uint = 0;
			var gain$count:uint = 0;
			var ore$count:uint = 0;
			var brickPort$count:uint = 0;
			var lumberPort$count:uint = 0;
			var woolPort$count:uint = 0;
			var gainPort$count:uint = 0;
			var orePort$count:uint = 0;
			var bankPort$count:uint = 0;
			var brickMax$count:uint = 0;
			var lumberMax$count:uint = 0;
			var woolMax$count:uint = 0;
			var gainMax$count:uint = 0;
			var oreMax$count:uint = 0;
			var knightMax$count:uint = 0;
			var monopolyMax$count:uint = 0;
			var richMax$count:uint = 0;
			var roadMax$count:uint = 0;
			var pointMax$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (min$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.min cannot be set twice.');
					}
					++min$count;
					this.min = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (max$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.max cannot be set twice.');
					}
					++max$count;
					this.max = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					this.grid.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.config.proto.DcatanGrid()));
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.number);
						break;
					}
					this.number.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 7:
					if (brick$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.brick cannot be set twice.');
					}
					++brick$count;
					this.brick = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (lumber$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.lumber cannot be set twice.');
					}
					++lumber$count;
					this.lumber = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (wool$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.wool cannot be set twice.');
					}
					++wool$count;
					this.wool = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (gain$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.gain cannot be set twice.');
					}
					++gain$count;
					this.gain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (ore$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.ore cannot be set twice.');
					}
					++ore$count;
					this.ore = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (brickPort$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.brickPort cannot be set twice.');
					}
					++brickPort$count;
					this.brickPort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 13:
					if (lumberPort$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.lumberPort cannot be set twice.');
					}
					++lumberPort$count;
					this.lumberPort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 14:
					if (woolPort$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.woolPort cannot be set twice.');
					}
					++woolPort$count;
					this.woolPort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 15:
					if (gainPort$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.gainPort cannot be set twice.');
					}
					++gainPort$count;
					this.gainPort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 16:
					if (orePort$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.orePort cannot be set twice.');
					}
					++orePort$count;
					this.orePort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 17:
					if (bankPort$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.bankPort cannot be set twice.');
					}
					++bankPort$count;
					this.bankPort = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 18:
					if (brickMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.brickMax cannot be set twice.');
					}
					++brickMax$count;
					this.brickMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 19:
					if (lumberMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.lumberMax cannot be set twice.');
					}
					++lumberMax$count;
					this.lumberMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 20:
					if (woolMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.woolMax cannot be set twice.');
					}
					++woolMax$count;
					this.woolMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 21:
					if (gainMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.gainMax cannot be set twice.');
					}
					++gainMax$count;
					this.gainMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 22:
					if (oreMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.oreMax cannot be set twice.');
					}
					++oreMax$count;
					this.oreMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 23:
					if (knightMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.knightMax cannot be set twice.');
					}
					++knightMax$count;
					this.knightMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 24:
					if (monopolyMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.monopolyMax cannot be set twice.');
					}
					++monopolyMax$count;
					this.monopolyMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 25:
					if (richMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.richMax cannot be set twice.');
					}
					++richMax$count;
					this.richMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 26:
					if (roadMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.roadMax cannot be set twice.');
					}
					++roadMax$count;
					this.roadMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 27:
					if (pointMax$count != 0) {
						throw new flash.errors.IOError('Bad data format: CcatanMap.pointMax cannot be set twice.');
					}
					++pointMax$count;
					this.pointMax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
