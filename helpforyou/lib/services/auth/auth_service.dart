import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:helpforyou/app_routes.dart';
import 'package:helpforyou/shared/providers/auth_state.dart';
import 'package:helpforyou/shared/responses/default_response.dart';
import 'package:provider/provider.dart';

import '../database/database_service.dart';

class AuthService {
  static Future<void> buildInitialPage(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final response = await DatabaseService.getUserData(user.uid);

      if (response.status == ResponseStatus.SUCCESS) {
        Provider.of<AuthState>(context, listen: false)
            .setUser(response.object!);
      }

      await Future.delayed(Duration(seconds: 2));

      Navigator.pushReplacementNamed(context, AppRoutes.app);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.signin);
    }
  }

  static User user() => FirebaseAuth.instance.currentUser!;

  static Future<DefaultResponse<User?>> signUp(
    String email,
    String password,
  ) async {
    final auth = FirebaseAuth.instance;

    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? signedInUser = authResult.user;

      return ResponseBuilder.success<User?>(object: signedInUser);
    } catch (e) {
      return ResponseBuilder.failed<User?>(message: e.toString());
    }
  }

  static Future<bool> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    final auth = FirebaseAuth.instance;

    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        final response = await DatabaseService.getUserData(user.uid);

        if (response.status == ResponseStatus.SUCCESS) {
          Provider.of<AuthState>(context, listen: false)
              .setUser(response.object!);
        }
        return true;
      }
      return false;
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
