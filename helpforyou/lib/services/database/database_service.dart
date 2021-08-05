import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/shared/models/audio_model.dart';
import 'package:helpforyou/shared/models/user_model.dart';
import 'package:helpforyou/shared/responses/default_response.dart';

class DatabaseService {
  // static Stream<List<AudioModel>> audios() {
  //   final userId = AuthService.user().uid;

  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .collection('audios')
  //       .orderBy('date', descending: true)
  //       .snapshots()
  //       .map<List<AudioModel>>(
  //     (event) {
  //       return event.docs.map((e) => AudioModel.fromMap(e.data())).toList();
  //     },
  //   );
  // }

  static Future<List<AudioModel>> audios() async {
    final userId = AuthService.user().uid;

    final docs = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('audios')
        .orderBy('date', descending: true)
        .get();

    return docs.docs.map((e) => AudioModel.fromMap(e.data())).toList();

    //     .snapshots()
    //     .map<List<AudioModel>>(
    //   (event) {
    //     return event.docs.map((e) => AudioModel.fromMap(e.data())).toList();
    //   },
    // );
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
      return ResponseBuilder.failed(message: 'Falha ao acessar dados');
    }
  }
}
