import 'message_model.dart';

class ChatModel {
  final String id;
  final String title;
  final List<MessageModel> messages;
  final DateTime createdAt;

  const ChatModel({
    required this.id,
    required this.title,
    required this.messages,
    required this.createdAt,
  });
}