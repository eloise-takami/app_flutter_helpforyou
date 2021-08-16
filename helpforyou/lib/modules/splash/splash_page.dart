import 'package:flutter/material.dart';
import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService.buildInitialPage(context);

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
          CircularProgressIndicator(),
          // valueColor:
          //     AlwaysStoppedAnimation(Color.fromRGBO(63, 71, 206, 1.0)),
          // strokeWidth: 11,
        ],
      )),
    );
  }
}
