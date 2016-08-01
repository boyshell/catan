package org.shell.mmo.sample.message.proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import org.shell.mmo.sample.message.proto.CatanScore;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReqCatanDone extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SCORE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("org.shell.mmo.sample.message.proto.ReqCatanDone.score", "score", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return org.shell.mmo.sample.message.proto.CatanScore; });

		[ArrayElementType("org.shell.mmo.sample.message.proto.CatanScore")]
		public var score:Array = [];

		/**
		 *  @private
		 */
		public static const GAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqCatanDone.gain", "gain", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gain$field:int;

		private var hasField$0:uint = 0;

		public function clearGain():void {
			hasField$0 &= 0xfffffffe;
			gain$field = new int();
		}

		public function get hasGain():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set gain(value:int):void {
			hasField$0 |= 0x1;
			gain$field = value;
		}

		public function get gain():int {
			return gain$field;
		}

		/**
		 *  @private
		 */
		public static const TOTALGAIN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("org.shell.mmo.sample.message.proto.ReqCatanDone.totalGain", "totalGain", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var totalGain$field:int;

		public function clearTotalGain():void {
			hasField$0 &= 0xfffffffd;
			totalGain$field = new int();
		}

		public function get hasTotalGain():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set totalGain(value:int):void {
			hasField$0 |= 0x2;
			totalGain$field = value;
		}

		public function get totalGain():int {
			return totalGain$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var score$index:uint = 0; score$index < this.score.length; ++score$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.score[score$index]);
			}
			if (hasGain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, gain$field);
			}
			if (hasTotalGain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, totalGain$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gain$count:uint = 0;
			var totalGain$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.score.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new org.shell.mmo.sample.message.proto.CatanScore()));
					break;
				case 2:
					if (gain$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanDone.gain cannot be set twice.');
					}
					++gain$count;
					this.gain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (totalGain$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqCatanDone.totalGain cannot be set twice.');
					}
					++totalGain$count;
					this.totalGain = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
