import 'package:architect_hub/model/user_model.dart';

class NotificationModel {
  final int id;
  final UserModel secondUser;
  final String content;
  final DateTime date;
  final bool seen;
  NotificationModel({
    required this.id,
    required this.secondUser,
    required this.content,
    required this.date,
    required this.seen,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as int,
      secondUser: UserModel.fromJson(map['secondUser']),
      content: map['content'] as String,
      date: DateTime.parse(map['date'] as String),
      seen: map['seen'] as bool,
    );
  }

  static List<NotificationModel> listFromJson(dynamic json) =>
      List<NotificationModel>.from(
        json.map((message) => NotificationModel.fromJson(message)),
      );

  @override
  String toString() {
    return 'NotificationModel(id: $id, secondUser: $secondUser, content: $content, date: $date, seen: $seen)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.secondUser == secondUser &&
        other.content == content &&
        other.date == date &&
        other.seen == seen;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        secondUser.hashCode ^
        content.hashCode ^
        date.hashCode ^
        seen.hashCode;
  }
}
