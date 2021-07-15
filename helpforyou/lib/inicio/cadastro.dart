import 'package:flutter/material.dart';
import 'package:helpforyou/inicio/home.dart';
import 'package:helpforyou/services/auth_service.dart';
import 'textfield.dart';

class Cadastro extends StatelessWidget {
  String _name;
  String _email;
  String _password;
  String _rg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/borda2.png"),
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
                child: Image.asset("lib/assets/h_sembranco.png"),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedNameField(
                  hintText: "Your Name",
                  onChanged: (value) {
                    _name = value;
                  }),
              RoundedInputField(
                  hintText: "Your E-mail",
                  onChanged: (value) {
                    _email = value;
                  }),
              RoundedPasswordField(
                  hintText: "Your Password",
                  onChanged: (value) {
                    _password = value;
                  }),
              RoundedCPFField(
                  hintText: "Your RG",
                  onChanged: (value) {
                    _rg = value;
                  }),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  height: 60,
                  width: 90,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.2, 1],
                      colors: [
                        Colors.cyan[700],
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      bool isValid = await AuthService.signUp(
                        context,
                        _name,
                        _email,
                        _password,
                        _rg,
                      );
                      if (isValid) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false,
                        );
                        // Navigator.pop(context);
                      } else {
                        print("erro cadastro");
                      }
                    },
                    child: Text(
                      "                    Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
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
