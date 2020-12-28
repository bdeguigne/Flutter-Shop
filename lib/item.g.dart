// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 0;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      fields[0] as String,
      fields[1] as String,
      fields[2] as double,
      fields[3] as double,
      fields[4] as bool,
      fields[5] as String,
      (fields[6] as List)?.cast<String>(),
      fields[7] as String,
      (fields[8] as List)?.cast<String>(),
      fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.newPrice)
      ..writeByte(4)
      ..write(obj.isPromo)
      ..writeByte(5)
      ..write(obj.thumbnail)
      ..writeByte(6)
      ..write(obj.screenshots)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.isFeatured);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
