// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int id;
  String username;
  String profilePicture;
  int rating;
  UserModel({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'profilePicture': profilePicture,
      'rating': rating,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      username: map['username'] as String,
      profilePicture: map['profilePicture'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, profilePicture: $profilePicture, rating: $rating)';
  }
}
