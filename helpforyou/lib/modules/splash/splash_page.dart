import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helpforyou/services/database/database_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpforyou/shared/providers/auth_state.dart';
import 'package:helpforyou/shared/responses/default_response.dart';
import 'package:helpforyou/shared/themes/app_images.dart';

import '../app/app_page.dart';
import '../signin/signin_page.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        Duration(seconds: 3),
        () async {
          if (user != null) {
            final response = await DatabaseService.getUserData(user!.uid);

            if (response.status == ResponseStatus.SUCCESS) {
              Provider.of<AuthState>(context, listen: false)
                  .setUser(response.object!);
            }
          }
        },
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return user != null ? AppPage() : SigninPage();
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
