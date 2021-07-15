import 'dart:async';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpforyou/inicio/home.dart';
import 'package:helpforyou/services/auth_state.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user = FirebaseAuth.instance.currentUser;
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     Duration(seconds: 3),
  //     () async {
  //       final user = FirebaseAuth.instance.currentUser;

  //       if (user != null) {
  //         final documentReference =
  //             FirebaseFirestore.instance.collection('users').doc(user.uid);
  //         await Provider.of<AuthState>(context)
  //             .setUserWithDocumentReference(documentReference);
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Home(),
  //           ),
  //         );
  //       } else {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Login(),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 3),
          () async {
            // final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              final documentReference =
                  FirebaseFirestore.instance.collection('users').doc(user.uid);
              await Provider.of<AuthState>(context)
                  .setUserWithDocumentReference(documentReference);
            }
          },
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (user != null) {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Home(),
              //   ),
              // );
              return Home();
            } else {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Login(),
              //   ),
              // );
              return Login();
            }
          }
          return Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('lib/assets/h_sembranco.png'),
                ),
                SizedBox(height: 10),
                CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Color.fromRGBO(63, 71, 206, 1.0)),
                  strokeWidth: 11,
                ),
              ],
            )),
          );
        });
  }
}
