import 'package:architect_hub/model/user_model.dart';
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
  PortifolioModel({
    required this.id,
    required this.user,
    required this.images,
    this.isFavor = false,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user': user.toJson(),
      'images': images,
    };
  }

  factory PortifolioModel.fromJson(Map<String, dynamic> map) {
    return PortifolioModel(
      id: map['id'],
      user: UserModel.fromJson(map['user']),
      images: List<String>.from(map['images'].map((x) => x)),
    );
  }

  static List<PortifolioModel> listFromJson(dynamic json) =>
      List<PortifolioModel>.from(
        json.map((model) => PortifolioModel.fromJson(model)),
      );

  @override
  String toString() => 'PortifolioModel(id: $id,user: $user, images: $images)';
}
