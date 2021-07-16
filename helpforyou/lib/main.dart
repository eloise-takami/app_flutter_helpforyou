import 'package:firebase_core/firebase_core.dart';
import 'package:helpforyou/shared/providers/auth_state/auth_state.dart';
import 'inicio/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthState())],
      child: TCC(),
    ),
  );
}

class TCC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelas mulheres',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),
      color: Colors.white,
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Color.fromRGBO(63, 71, 206, 1.0)));
  }
}
