import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpforyou/shared/models/usermodel.dart';
import 'package:helpforyou/shared/responses/default_response.dart';

class FirestoreService {
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
