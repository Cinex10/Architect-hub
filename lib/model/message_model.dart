import 'package:architect_hub/model/user_model.dart';

class MessageModel {
  DateTime date;
  String content;
  bool seen;
  UserModel sender;
  bool isIncoming;
  MessageModel({
    required this.date,
    required this.content,
    required this.seen,
    required this.sender,
    required this.isIncoming,
  });

  factory MessageModel.fromJson(Map<String, dynamic> map) {
    return MessageModel(
      date: DateTime.parse(map['date'] as String),
      seen: map['seen'] as bool,
      content: map['content'] as String,
      sender: UserModel.fromJson(map['sender']),
      isIncoming: map['isIncoming'] as bool,
    );
  }

  static List<MessageModel> listFromJson(dynamic json) =>
      List<MessageModel>.from(
        json.map((message) => MessageModel.fromJson(message)),
      );

  @override
  String toString() =>
      'MessageModel(isIncoming: $isIncoming, date: $date, content: $content, seen: $seen,sender : $sender)';

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.isIncoming == isIncoming &&
        other.date == date &&
        other.content == content;
  }

  @override
  int get hashCode => isIncoming.hashCode ^ date.hashCode ^ content.hashCode;
}
