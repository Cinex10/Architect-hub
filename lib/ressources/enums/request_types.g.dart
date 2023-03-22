// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_types.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestTypeAdapter extends TypeAdapter<RequestType> {
  @override
  final int typeId = 4;

  @override
  RequestType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RequestType.underReviewRequest;
      case 1:
        return RequestType.inExecutionRequest;
      case 2:
        return RequestType.completedRequest;
      case 3:
        return RequestType.draftRequest;
      default:
        return RequestType.underReviewRequest;
    }
  }

  @override
  void write(BinaryWriter writer, RequestType obj) {
    switch (obj) {
      case RequestType.underReviewRequest:
        writer.writeByte(0);
        break;
      case RequestType.inExecutionRequest:
        writer.writeByte(1);
        break;
      case RequestType.completedRequest:
        writer.writeByte(2);
        break;
      case RequestType.draftRequest:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
