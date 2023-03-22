import 'package:hive/hive.dart';

part 'property_type.g.dart';

@HiveType(typeId: 3)
enum PropertyType {
  @HiveField(0)
  villa,
  @HiveField(1)
  apartement,
  @HiveField(2)
  shop,
  @HiveField(3)
  offices,
  @HiveField(4)
  medical,
}
