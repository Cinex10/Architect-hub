// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PortifolioModelAdapter extends TypeAdapter<PortifolioModel> {
  @override
  final int typeId = 0;

  @override
  PortifolioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PortifolioModel(
      id: fields[0] as int,
      user: fields[1] as UserModel,
      images: (fields[2] as List).cast<String>(),
      isFavor: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PortifolioModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.images)
      ..writeByte(3)
      ..write(obj.isFavor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PortifolioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
