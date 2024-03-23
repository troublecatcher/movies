// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmotionAdapter extends TypeAdapter<Emotion> {
  @override
  final int typeId = 0;

  @override
  Emotion read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Emotion.good;
      case 1:
        return Emotion.decent;
      case 2:
        return Emotion.bad;
      default:
        return Emotion.good;
    }
  }

  @override
  void write(BinaryWriter writer, Emotion obj) {
    switch (obj) {
      case Emotion.good:
        writer.writeByte(0);
        break;
      case Emotion.decent:
        writer.writeByte(1);
        break;
      case Emotion.bad:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
