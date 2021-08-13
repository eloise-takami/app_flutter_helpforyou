import 'package:flutter/material.dart';
import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/services/database/database_service.dart';
import 'package:helpforyou/shared/models/user_model.dart';
import 'package:helpforyou/shared/providers/auth_state.dart';
import 'package:helpforyou/shared/responses/default_response.dart';
import 'package:helpforyou/shared/themes/app_images.dart';
import 'package:helpforyou/shared/widgets/rounded_input_text_field.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? _name;

  String? _email;

  String? _password;

  String? _rg;

  bool _isLoading = false;

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });

    final signUpResponse = await AuthService.signUp(_email!, _password!);

    if (signUpResponse.status == ResponseStatus.SUCCESS &&
        signUpResponse.object != null) {
      final user = UserModel(
        id: signUpResponse.object!.uid,
        name: _name!,
        email: _email!,
        rg: _rg!,
      );

      Provider.of<AuthState>(context, listen: false).setUser(user);

      await DatabaseService.saveSignUpData(user);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade700,
          content: Text('Erro ao tentar realizar cadastro'),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/h_sembranco.png"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
        ),
        child: Form(
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: Text(Imagem.logo_h),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedInputTextField(
                hintText: "Nome completo",
                onChanged: (value) {
                  _name = value;
                },
                autofocus: true,
                obscureText: false,
                icon: Icons.person_outline_rounded,
                keyboardType: TextInputType.name,
              ),
              RoundedInputTextField(
                hintText: "E-mail",
                onChanged: (value) {
                  _email = value;
                },
                obscureText: false,
              ),
              RoundedInputTextField(
                hintText: "Crie uma senha",
                onChanged: (value) {
                  _password = value;
                },
                autofocus: false,
                obscureText: true,
                icon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
              ),
              RoundedInputTextField(
                hintText: "RG",
                onChanged: (value) {
                  _rg = value;
                },
                icon: Icons.format_list_numbered,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  height: 60,
                  width: 90,
                  //alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.2, 1],
                      colors: [
                        Colors.cyan[700]!,
                        Color.fromRGBO(118, 125, 219, 1.0),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.97),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      onTap: _isLoading ? null : _signUp,
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                'Cadastrar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
