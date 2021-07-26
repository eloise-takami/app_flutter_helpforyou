import 'package:flutter/material.dart';
import 'package:helpforyou/shared/models/usermodel.dart';

class AuthState extends ChangeNotifier {
  UserModel? _userModel;

  void setUser(UserModel userModel) => _userModel = userModel;

  UserModel? get getUser => _userModel;
}
