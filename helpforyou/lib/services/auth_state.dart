import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:helpforyou/model/usermodel.dart';
import 'package:provider/provider.dart';

class AuthState extends ChangeNotifier {
  UserModel _userModel;
  Future<void> setUserWithDocumentReference(
      DocumentReference documentReference) async {
    final doc = await documentReference.get();
    _userModel = UserModel.fromDoc(doc);
  }

  void setUser(UserModel userModel) => _userModel = userModel;

  get getUser => _userModel;
}
