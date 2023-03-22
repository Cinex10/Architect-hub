import 'package:architect_hub/model/chat_model.dart';
import 'package:architect_hub/model/notification_model.dart';

abstract class BaseInboxRepository {
  Future<List<ChatModel>> getMessages();
  Future<List<NotificationModel>> getNotifications();
}
