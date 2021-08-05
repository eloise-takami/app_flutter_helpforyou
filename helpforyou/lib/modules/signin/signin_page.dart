import 'package:flutter/material.dart';
import 'package:helpforyou/app_routes.dart';
import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/shared/themes/app_images.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String _text = '';

  IconData iconsenha = Icons.visibility_off; //icone de visibilidade de senha
  int i = 0;
  bool visible = false;
  bool param = true;
  String? _email;
  String _password = "123456";
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/borda2.png"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(
          top: 88,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(Imagem.logo_nome),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              //autofocus: true
              controller: emailController,
              keyboardType: TextInputType.emailAddress, //aparece o @
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                  color: Color.fromRGBO(63, 71, 206, 1.0),
                ),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passController,
              keyboardType: TextInputType.text,
              obscureText: param,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.lock,
                    color: Color.fromRGBO(63, 71, 206, 1.0),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        i++;
                        param = !param;
                        if (i % 2 == 0) {
                          iconsenha = Icons.visibility_off_sharp;
                        } else {
                          iconsenha = Icons.visibility;
                        }
                      });
                    },
                    child: Icon(
                      iconsenha,
                      color: Color.fromRGBO(63, 71, 206, 1.0),
                    ),
                  ),
                  labelText: "Password"),
            ),
            //_montarTextField("Senha", true,Icon(Icons.lock, color: Color.fromRGBO(63, 71, 206, 1.0))),

            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  print(" boatao Forgot password");
                },
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 1],
                  colors: [
                    Colors.cyan[700]!,
                    Color.fromRGBO(110, 71, 190, 1.0),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _montarTextoBotao("                      Login"),
                    ],
                  ),
                  onPressed: () async {
                    print("botao login");
                    _email = emailController.text;
                    _password = passController.text;
                    print("$_password");
                    bool isValid = await AuthService.login(_email!, _password);
                    if (isValid) {
                      print("conectado");

                      Navigator.pushNamed(context, AppRoutes.app);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AppPage()),
                      // );
                    } else {
                      print('login problem');
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signup);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignupPage()),
                    // ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _montarTextoBotao(String textoBotao) {
    return Text(
      textoBotao,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  Widget _montarTextField(String titulo, bool visible, Icon icon) {
    return TextFormField(
      //autofocus: true
      obscureText: visible,

      keyboardType: TextInputType.emailAddress, //aparece o @

      decoration: InputDecoration(
        border: InputBorder.none,
        icon: icon,
        labelText: titulo,
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
