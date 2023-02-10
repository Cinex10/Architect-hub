import 'package:architect_hub/model/user_model.dart';

class PortifolioModel {
  UserModel user;
  List<String> images;
  PortifolioModel({
    required this.user,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': user.toJson(),
      'images': images,
    };
  }

  factory PortifolioModel.fromJson(Map<String, dynamic> map) {
    return PortifolioModel(
      user: UserModel.fromJson(map['user']),
      images: List<String>.from(map['images'].map((x) => x)),
    );
  }

  static List<PortifolioModel> listFromJson(dynamic json) =>
      List<PortifolioModel>.from(
        json.map((model) => PortifolioModel.fromJson(model)),
      );

  @override
  String toString() => 'PortifolioModel(user: $user, images: $images)';
}
