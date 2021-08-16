import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String rg;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.rg,
  });

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      name: doc['name'],
      email: doc['email'],
      rg: doc['rg'],
    );
  }
}
