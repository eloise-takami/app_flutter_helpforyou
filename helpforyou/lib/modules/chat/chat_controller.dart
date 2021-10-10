import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/services/database/database_service.dart';
import 'package:helpforyou/shared/models/chat_model.dart';

class ChatController {
  String? groupId;

  void init(String psychologistId) {
    final userId = AuthService.user().uid;

    groupId = userId + '-' + psychologistId;
  }

  Future<void> sendMessage({
    required String msg,
    bool sentByPsychologist = false,
  }) async {
    final chat = ChatModel(
      content: msg,
      sentByPsychologist: sentByPsychologist,
      groupId: groupId!,
      date: DateTime.now(),
    );

    await DatabaseService.saveMessage(chat);
  }
}
