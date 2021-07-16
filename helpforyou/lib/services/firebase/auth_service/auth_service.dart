import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpforyou/shared/responses/default_response.dart';

class AuthService {
  static Future<DefaultResponse<User>> signUp(
    String email,
    String password,
  ) async {
    final auth = FirebaseAuth.instance;

    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User signedInUser = authResult.user;

      return ResponseBuilder.success(object: signedInUser);
    } catch (e) {
      return ResponseBuilder.failed();
    }
  }

  static Future<bool> login(String email, String password) async {
    final auth = FirebaseAuth.instance;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> logout() async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
