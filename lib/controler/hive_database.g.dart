// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class contectdataAdapter extends TypeAdapter<contect_data> {
  @override
  final int typeId = 0;

  @override
  contect_data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return contect_data()
      ..name = fields[0] as String?
      ..number = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, contect_data obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is contectdataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
