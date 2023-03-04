import 'package:architect_hub/model/user_model.dart';

class RequestModel {
  int id;
  UserModel user;
  String state;
  String title;
  DateTime date;
  int numberOfOffers;
  List<String> images;
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
      'state': state,
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
      state: map['state'] as String,
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
    return 'RequestModel(id: $id, user: $user, state: $state, title: $title, date: $date, numberOfOffers: $numberOfOffers, usersProfilePicture: $usersProfilePicture ,  images: $images)';
  }
}
