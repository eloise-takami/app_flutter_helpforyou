import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpforyou/inicio/home.dart';
import 'package:helpforyou/shared/providers/auth_state/auth_state.dart';
import 'package:helpforyou/services/firebase/firestore_service/firestore_service.dart';
import 'package:helpforyou/shared/responses/default_response.dart';
import 'package:helpforyou/shared/themes/app_images.dart';
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        Duration(seconds: 3),
        () async {
          if (user != null) {
            final response = await FirestoreService.getUserData(user.uid);

            if (response.status == ResponseStatus.SUCCESS) {
              Provider.of<AuthState>(context, listen: false)
                  .setUser(response.object);
            }
          }
        },
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return user != null ? Home() : Login();
        }
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: Image.asset(Imagem.logo_h),
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
      },
    );
  }
}
