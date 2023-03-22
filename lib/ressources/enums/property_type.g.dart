// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PropertyTypeAdapter extends TypeAdapter<PropertyType> {
  @override
  final int typeId = 3;

  @override
  PropertyType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PropertyType.villa;
      case 1:
        return PropertyType.apartement;
      case 2:
        return PropertyType.shop;
      case 3:
        return PropertyType.offices;
      case 4:
        return PropertyType.medical;
      default:
        return PropertyType.villa;
    }
  }

  @override
  void write(BinaryWriter writer, PropertyType obj) {
    switch (obj) {
      case PropertyType.villa:
        writer.writeByte(0);
        break;
      case PropertyType.apartement:
        writer.writeByte(1);
        break;
      case PropertyType.shop:
        writer.writeByte(2);
        break;
      case PropertyType.offices:
        writer.writeByte(3);
        break;
      case PropertyType.medical:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertyTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
