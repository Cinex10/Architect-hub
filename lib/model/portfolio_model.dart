import 'package:architect_hub/model/user_model.dart';
import 'package:architect_hub/ressources/enums/property_type.dart';
import 'package:architect_hub/ressources/extensions/property_type_extension.dart';
import 'package:architect_hub/ressources/extensions/string_extension.dart';
import 'package:hive/hive.dart';

part 'portfolio_model.g.dart';

@HiveType(typeId: 0)
class PortifolioModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  UserModel user;
  @HiveField(2)
  List<String> images;
  @HiveField(3)
  bool isFavor;
  @HiveField(4)
  PropertyType propertyType;
  PortifolioModel({
    required this.id,
    required this.user,
    required this.images,
    this.isFavor = false,
    required this.propertyType,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user': user.toJson(),
      'images': images,
      'propertyType': propertyType.propertyTypeToString,
    };
  }

  factory PortifolioModel.fromJson(Map<String, dynamic> map) {
    return PortifolioModel(
        id: map['id'],
        user: UserModel.fromJson(map['user']),
        images: List<String>.from(map['images'].map((x) => x)),
        propertyType: (map['propertyType'] as String).propertyTypeToEnum);
  }

  static List<PortifolioModel> listFromJson(dynamic json) =>
      List<PortifolioModel>.from(
        json.map((model) => PortifolioModel.fromJson(model)),
      );

  @override
  String toString() =>
      'PortifolioModel(id: $id,user: $user, images: $images, propertyType: ${propertyType.propertyTypeToString})';
}
