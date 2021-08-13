import 'contact_model.dart';

class ChatModel {
  final bool isTyping;
  final String lastMessage;
  final ContactModel contact;
  final DateTime lastMessageTime;

  ChatModel(
      {required this.isTyping,
      required this.lastMessage,
      required this.lastMessageTime,
      required this.contact});

  static List<ChatModel> list = [
    ChatModel(
      isTyping: true,
      lastMessage: "hello!",
      lastMessageTime: DateTime.now(),
      contact: ContactModel(name: " Psicólogo"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "Sure, no problem Jhon!",
      lastMessageTime: DateTime.now(),
      contact: ContactModel(name: "Psicólogo"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "thank you Jhon!",
      lastMessageTime: DateTime.now(),
      contact: ContactModel(name: "Psicólogo"),
    ),
  ];
}
