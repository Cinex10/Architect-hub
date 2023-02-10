class UserModel {
  int id;
  String username;
  String profilePicture;
  double rating;
  UserModel({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'profilePicture': profilePicture,
      'rating': rating,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      username: map['username'] as String,
      profilePicture: map['profilePicture'] as String,
      rating: map['rating'] as double,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, profilePicture: $profilePicture, rating: $rating)';
  }
}
