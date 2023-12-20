// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_add.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAddAdapter extends TypeAdapter<HiveAdd> {
  @override
  final int typeId = 0;

  @override
  HiveAdd read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAdd(
      foodName: fields[0] as String,
      foodDescription: fields[1] as String,
      foodImage: (fields[2] as List?)?.cast<int>(),
      value: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAdd obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.foodName)
      ..writeByte(1)
      ..write(obj.foodDescription)
      ..writeByte(2)
      ..write(obj.foodImage)
      ..writeByte(3)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAddAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
