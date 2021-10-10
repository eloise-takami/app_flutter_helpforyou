import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/shared/models/audio_model.dart';
import 'package:helpforyou/shared/models/chat_model.dart';
import 'package:helpforyou/shared/models/post_model.dart';
import 'package:helpforyou/shared/models/psychologist_model.dart';
import 'package:helpforyou/shared/models/user_model.dart';
import 'package:helpforyou/shared/responses/default_response.dart';

class DatabaseService {
  static Future<List<AudioModel>> audios() async {
    final userId = AuthService.user().uid;

    final docs = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('audios')
        .orderBy('date', descending: true)
        .get();

    return docs.docs.map((e) => AudioModel.fromMap(e.data())).toList();
  }

  static Future<List<PsychologistModel>> psychologists() async {
    final docs =
        await FirebaseFirestore.instance.collection('psychologists').get();

    return docs.docs.map((e) => PsychologistModel.fromMap(e.data())).toList();
  }

  static Future<void> saveAudio(AudioModel audioModel) async {
    final userId = AuthService.user().uid;
    final documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('audios')
        .doc('${audioModel.date.millisecondsSinceEpoch}');

    await documentReference.set(audioModel.toMap());
  }

  static Future<void> saveMessage(ChatModel chatModel) async {
    final documentReference = FirebaseFirestore.instance
        .collection('conversations')
        .doc(chatModel.groupId)
        .collection('messages')
        .doc('${chatModel.date.millisecondsSinceEpoch}');

    await documentReference.set(chatModel.toMap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> messages(
    String chatGroup,
  ) {
    return FirebaseFirestore.instance
        .collection('conversations')
        .doc(chatGroup)
        .collection('messages')
        .snapshots();
  }

  static Future<void> saveSignUpData(UserModel userModel) async {
    final documentReference =
        FirebaseFirestore.instance.collection('users').doc(userModel.id);

    await documentReference.set({
      'id': userModel.id,
      'name': userModel.name,
      'email': userModel.email,
      'rg': userModel.rg,
    }).catchError((error) => print('\n\n******Erro firestore****: $error\n\n'));
  }

  static Future<DefaultResponse<UserModel>> getUserData(String userId) async {
    final documentReference =
        FirebaseFirestore.instance.collection('users').doc(userId);

    final doc = await documentReference.get();

    if (doc.exists) {
      final data = doc.data();

      return ResponseBuilder.success(
        object: UserModel(
          id: userId,
          name: data!['name'],
          email: data['email'],
          rg: data['rg'],
        ),
      );
    } else {
      return ResponseBuilder.failed(message: 'Falha ao acessar dadoss');
    }
  }

  static Future<DefaultResponse<void>> savePost(PostModel postModel) async {
    final firestore = FirebaseFirestore.instance;

    try {
      final response =
          await firestore.collection("posts").add(postModel.toMap());
      return ResponseBuilder.success(object: response);
    } catch (e) {
      return ResponseBuilder.failed(message: 'Falha ao tentar salvar post');
    }
  }
}
