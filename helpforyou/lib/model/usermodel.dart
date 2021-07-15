import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String rg;
  

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.rg,
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