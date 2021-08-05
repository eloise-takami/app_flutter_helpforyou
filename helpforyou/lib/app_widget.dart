import 'package:flutter/material.dart';
import 'package:helpforyou/modules/app/app_page.dart';
import 'package:helpforyou/modules/audio_record/audio_record_page.dart';
import 'package:helpforyou/modules/signin/signin_page.dart';
import 'package:helpforyou/modules/signup/signup_page.dart';

import 'app_routes.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelas mulheres',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => SplashPage(),
        AppRoutes.signin: (context) => SigninPage(),
        AppRoutes.signup: (context) => SignupPage(),
        AppRoutes.app: (context) => AppPage(),
        AppRoutes.audio_record: (context) => AudioRecordPage(),
      },
      color: Colors.white,
    );
  }
}
