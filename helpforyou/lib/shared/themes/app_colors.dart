import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color roxo = Color.fromRGBO(62, 71, 208, 1.0);

  static final Color azulClaro = Colors.cyan.shade50;

  static Map<int, Color> thinaGreenCodes = {
    50: Color.fromRGBO(62, 71, 208, .1),
    100: Color.fromRGBO(62, 71, 208, .2),
    200: Color.fromRGBO(62, 71, 208, .3),
    300: Color.fromRGBO(62, 71, 208, .4),
    400: Color.fromRGBO(62, 71, 208, .5),
    500: Color.fromRGBO(62, 71, 208, .6),
    600: Color.fromRGBO(62, 71, 208, .7),
    700: Color.fromRGBO(62, 71, 208, .8),
    800: Color.fromRGBO(62, 71, 208, .9),
    900: Color.fromRGBO(62, 71, 208, 1),
  };

  static MaterialColor primarySwatch = MaterialColor(
    0xFF3E47D0,
    thinaGreenCodes,
  );
}
