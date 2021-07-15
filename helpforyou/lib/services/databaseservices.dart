import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:twitter/Constants/Constants.dart';
import 'package:helpforyou/model/usermodel.dart';
class DatabaseServices {
 
  static void updateUserData(UserModel user) {
    final userId = FirebaseAuth.instance.currentUser.uid;
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    userRef.update({
      'name': user.name,
      'email': user.email,
      //'rg': user.rg,
     // 'password': user.password,
    });
  }

  // static Future<QuerySnapshot> searchUsers(String name) async {
  //   Future<QuerySnapshot> users = userRef
  //       .where('name', isGreaterThanOrEqualTo: name)
  //       .where('name', isLessThan: name + 'z')
  //       .get();

  //   return users;
  // }
}