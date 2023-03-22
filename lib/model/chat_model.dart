// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:architect_hub/model/message_model.dart';
import 'package:architect_hub/model/user_model.dart';

class ChatModel {
  int id;
  UserModel secondUser;
  List<MessageModel> chat;
  ChatModel({
    required this.id,
    required this.secondUser,
    required this.chat,
  });

  factory ChatModel.fromJson(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] as int,
      secondUser: UserModel.fromJson(map['secondUser']),
      chat: MessageModel.listFromJson(map['chat']),
    );
  }

  static List<ChatModel> listFromJson(dynamic json) => List<ChatModel>.from(
        json.map((message) => ChatModel.fromJson(message)),
      );

  @override
  String toString() =>
      'ChatModel(id: $id, secondUser: $secondUser, chat: $chat)';

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.secondUser == secondUser &&
        listEquals(other.chat, chat);
  }

  @override
  int get hashCode => id.hashCode ^ secondUser.hashCode ^ chat.hashCode;
}
