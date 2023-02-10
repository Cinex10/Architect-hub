import 'dart:convert';
import 'package:architect_hub/model/user_model.dart';

class AnnounceModel {
  int id;
  UserModel user;
  String state;
  String title;
  DateTime date;
  int numberOfOffers;
  List<String> usersProfilePicture;
  AnnounceModel({
    required this.id,
    required this.user,
    required this.state,
    required this.title,
    required this.date,
    required this.numberOfOffers,
    required this.usersProfilePicture,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toMap(),
      'state': state,
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'numberOfOffers': numberOfOffers,
      'usersProfilePicture': usersProfilePicture,
    };
  }

  factory AnnounceModel.fromMap(Map<String, dynamic> map) {
    return AnnounceModel(
        id: map['id'] as int,
        user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
        state: map['state'] as String,
        title: map['title'] as String,
        // Ex: map['data'] = "1974-03-20 00:00:00.000"
        date: DateTime.parse(map['date'] as String),
        numberOfOffers: map['numberOfOffers'] as int,
        usersProfilePicture: List<String>.from(
          (map['usersProfilePicture'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory AnnounceModel.fromJson(String source) =>
      AnnounceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnnounceModel(id: $id, user: $user, state: $state, title: $title, date: $date, numberOfOffers: $numberOfOffers, usersProfilePicture: $usersProfilePicture)';
  }
}
