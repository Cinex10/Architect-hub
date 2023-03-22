import 'package:architect_hub/model/user_model.dart';
import 'package:architect_hub/ressources/enums/request_types.dart';
import 'package:architect_hub/ressources/extensions/request_type_extension.dart';
import 'package:architect_hub/ressources/extensions/string_extension.dart';
import 'package:hive/hive.dart';

part 'request_model.g.dart';

@HiveType(typeId: 2)
class RequestModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  UserModel user;
  @HiveField(2)
  RequestType state;
  @HiveField(3)
  String title;
  @HiveField(4)
  DateTime date;
  @HiveField(5)
  int numberOfOffers;
  @HiveField(6)
  List<String> images;
  @HiveField(7)
  List<String> usersProfilePicture;
  RequestModel({
    required this.id,
    required this.user,
    required this.state,
    required this.title,
    required this.date,
    required this.numberOfOffers,
    required this.usersProfilePicture,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user': user.toJson(),
      'state': state.requestTypeToString,
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'numberOfOffers': numberOfOffers,
      'usersProfilePicture': usersProfilePicture,
      'images': images,
    };
  }

  factory RequestModel.fromJson(Map<String, dynamic> map) {
    return RequestModel(
      id: map['id'] as int,
      user: UserModel.fromJson(map['user']),
      state: (map['state'] as String).requestTypeToEnum,
      title: map['title'] as String,
      // Ex: map['data'] = "1974-03-20 00:00:00.000"
      date: DateTime.parse(map['date'] as String),
      numberOfOffers: map['numberOfOffers'] as int,
      usersProfilePicture:
          List<String>.from(map['usersProfilePicture'].map((x) => x)),
      images: List<String>.from(map['images'].map((x) => x)),
    );
  }

  static List<RequestModel> listFromJson(dynamic json) =>
      List<RequestModel>.from(
        json.map((model) => RequestModel.fromJson(model)),
      );

  @override
  String toString() {
    return 'RequestModel(id: $id, user: $user, state: $state, title: $title, date: $date, numberOfOffers: $numberOfOffers, usersProfilePicture: $usersProfilePicture ,  images: $images , state: ${state.requestTypeToString})';
  }
}
