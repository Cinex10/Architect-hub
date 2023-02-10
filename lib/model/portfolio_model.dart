import 'dart:convert';
import 'package:architect_hub/model/user_model.dart';

class PortifolioModel {
  UserModel user;
  List<String> images;
  PortifolioModel({
    required this.user,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'images': images,
    };
  }

  factory PortifolioModel.fromMap(Map<String, dynamic> map) {
    return PortifolioModel(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      images: List<String>.from((map['images'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory PortifolioModel.fromJson(String source) =>
      PortifolioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PortifolioModel(user: $user, images: $images)';
}
