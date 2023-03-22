// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestModelAdapter extends TypeAdapter<RequestModel> {
  @override
  final int typeId = 2;

  @override
  RequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RequestModel(
      id: fields[0] as int,
      user: fields[1] as UserModel,
      state: fields[2] as RequestType,
      title: fields[3] as String,
      date: fields[4] as DateTime,
      numberOfOffers: fields[5] as int,
      usersProfilePicture: (fields[7] as List).cast<String>(),
      images: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RequestModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.state)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.numberOfOffers)
      ..writeByte(6)
      ..write(obj.images)
      ..writeByte(7)
      ..write(obj.usersProfilePicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
