import 'package:architect_hub/model/chat_model.dart';
import 'package:architect_hub/model/message_model.dart';
import 'package:architect_hub/model/notification_model.dart';
import 'package:architect_hub/repository/remote/inbox_repository/inbox_repository.dart';
import 'package:architect_hub/ressources/enums/status.dart';
import 'package:flutter/material.dart';

class InboxViewModel extends ChangeNotifier {
  final InboxRepository _inboxRepository = InboxRepository();

  int? nbUnreadMessages;
  int? nbUnreadNotifications;

  List<ChatModel> chats = [];
  List<MessageModel> chatHeads = [];
  List<NotificationModel> notifications = [];

  int? getTotalNotificationsCount() {
    int m = (nbUnreadMessages != null) ? nbUnreadMessages! : 0;
    int n = (nbUnreadNotifications != null) ? nbUnreadNotifications! : 0;
    int sum = m + n;
    if (sum == 0) {
      return null;
    }
    return sum;
  }

  Status loadingStatus = Status.completed;

  void changeLoadingStatus(Status newStatus) {
    loadingStatus = newStatus;
    notifyListeners();
  }

  Future<void> getMessages({bool withShimmerEffect = true}) async {
    if (withShimmerEffect) changeLoadingStatus(Status.loading);
    chats = await _inboxRepository.getMessages();
    chatHeads = chats.map((chat) => chat.chat.first).toList();
    nbUnreadMessages = chatHeads
        .map((chatHead) => !chatHead.seen ? 1 : 0)
        .reduce((value, element) => value + element);
    notifyListeners();
    if (withShimmerEffect) changeLoadingStatus(Status.completed);
  }

  Future<void> getNotifications({bool withShimmerEffect = true}) async {
    if (withShimmerEffect) changeLoadingStatus(Status.loading);
    notifications = await _inboxRepository.getNotifications();
    nbUnreadNotifications = notifications
        .map((notification) => !notification.seen ? 1 : 0)
        .reduce((value, element) => value + element);
    if (withShimmerEffect) changeLoadingStatus(Status.completed);
  }
}
