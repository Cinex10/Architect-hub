import 'dart:convert';

import 'package:architect_hub/model/chat_model.dart';
import 'package:architect_hub/model/notification_model.dart';
import 'package:architect_hub/repository/remote/inbox_repository/base_inbox_repository.dart';
import 'package:flutter/services.dart';

class InboxRepository extends BaseInboxRepository {
  @override
  Future<List<ChatModel>> getMessages() async {
    return await Future.delayed(const Duration(seconds: 1)).then((value) async {
      final String response =
          await rootBundle.loadString('assets/dummy_data/messages.json');
      final data = jsonDecode(response);
      List<ChatModel> list = ChatModel.listFromJson(data);
      return list;
    });
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    return await Future.delayed(const Duration(seconds: 1)).then((value) async {
      final String response =
          await rootBundle.loadString('assets/dummy_data/notifications.json');
      final data = jsonDecode(response);
      List<NotificationModel> list = NotificationModel.listFromJson(data);
      return list;
    });
  }
}
