import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:helpforyou/model/usermodel.dart';
import 'package:provider/provider.dart';

import 'auth_state.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _fireStore = FirebaseFirestore.instance;

  static Future<bool> signUp(BuildContext context, String name, String email,
      String password, String rg) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User signedInUser = authResult.user;

      if (signedInUser != null) {
        final documentReference =
            _fireStore.collection('users').doc(signedInUser.uid);
        final user =
            UserModel(id: signedInUser.uid, name: name, email: email, rg: rg);
        Provider.of<AuthState>(context).setUser(user);
        documentReference.set({
          'id': signedInUser.uid,
          'name': name,
          'email': email,
          'rg': rg,
        });
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print("erro");
      print(e);
      return false;
    }
  }

  static void logout() {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
