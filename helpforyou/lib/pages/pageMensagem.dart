import 'package:flutter/material.dart';

class PageMensagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image(
         image: AssetImage('lib/assets/h_sembranco.png'),
         width: 35.0,
        ),
      ),
    );
  }
}