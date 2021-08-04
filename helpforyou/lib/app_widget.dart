import 'package:flutter/material.dart';

import 'modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelas mulheres',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: AppColors.primarySwatch,
      ),
      home: SplashPage(),
      color: Colors.white,
    );
  }
}
