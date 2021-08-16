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
      lastMessage: "ooi, como vai? queria te pedir aju...",
      lastMessageTime: DateTime.now(),
      contact: ContactModel(name: " Maria Fernanda"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "Sem problemas",
      lastMessageTime: DateTime.now(),
      contact: ContactModel(name: "João Carlos"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "Mto obggg!",
      lastMessageTime: DateTime.now(),
      contact: ContactModel(name: "Gabriel Silva"),
    ),
  ];
}
