import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/app_routes.dart';
import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/shared/models/user_model.dart';
import 'package:helpforyou/shared/providers/auth_state.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:helpforyou/shared/themes/app_images.dart';
import 'package:provider/provider.dart';

class RegistrationDataPage extends StatefulWidget {
  const RegistrationDataPage({Key? key}) : super(key: key);

  @override
  _RegistrationDataPageState createState() => _RegistrationDataPageState();
}

class _RegistrationDataPageState extends State<RegistrationDataPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage(Imagem.logo_h),
          width: 35.0,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                print("update dados do usuário");
              },
              child: Icon(
                Icons.check,
                color: AppColors.roxo,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 15,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundColor: AppColors.roxo,
                  child: Icon(Icons.person, color: AppColors.branco, size: 60,)
                ),
              ],
            ),
            Consumer<AuthState>(
              builder: (context, userData, __) {
                final response = userData.getUser;
                final user = response == null
                    ? UserModel(id: "", name: "name", email: "email", rg: "rg")
                    : response;
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      TextFormField(
                        cursorColor: Color.fromRGBO(62, 71, 208, 1.0),
                        initialValue: user.name,
                        //autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Name:',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(62, 71, 208, 1.0),
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        validator: (input) => input!.trim().length < 2
                            ? 'please enter valid name'
                            : null,
                        style: TextStyle(fontSize: 18),
                        onSaved: (value) {
                          user.name = value!;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Color.fromRGBO(62, 71, 208, 1.0),
                        keyboardType: TextInputType.emailAddress,
                        initialValue: user.email,
                        //autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'E-mail:',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(62, 71, 208, 1.0),
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(fontSize: 18),
                        onSaved: (value) {
                          user.email = value!;
                        },
                      ),
                      SizedBox(height: 10),
                      // TextFormField(
                      //   cursorColor: Color.fromRGBO(62, 71, 208, 1.0),
                      //   initialValue: _password,
                      //   //autofocus: true,
                      //   decoration: InputDecoration(
                      //     labelText: 'Password:',
                      //     labelStyle: TextStyle(
                      //       color: Color.fromRGBO(62, 71, 208, 1.0),
                      //       fontWeight: FontWeight.w700,
                      //       fontSize: 18,
                      //     ),
                      //   ),
                      //   style: TextStyle(fontSize: 18),
                      //   onSaved: (value) {
                      //     _password = value;
                      //   },
                      // ),
                      // SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Color.fromRGBO(62, 71, 208, 1.0),
                        initialValue: user.rg,
                        //autofocus: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'RG:',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(62, 71, 208, 1.0),
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(fontSize: 18),
                        onSaved: (value) {
                          user.rg = value!;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('site');
                          //! colocar o site
                        },
                        child: Container(
                          height: 100,
                          width: 285,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            //border: new Border.all( color:Color.fromRGBO(63,71,206,1.0), width:4),
                            color: Colors.cyan[50],
                            border: new Border.all(
                                    color: Color.fromRGBO(63, 71, 206, 1.0),
                                    width: 4),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                " Se tiver alguma dúvida \n entre em contato conosco \n 2021helpforyou@gmail.com",
                                style: GoogleFonts.breeSerif(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromRGBO(63, 71, 206, 1.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Sair da conta'),
        icon: Icon(Icons.logout),
        onPressed: () async {
          final response = await AuthService.logout();
          if (response) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.signin,
              (route) => false,
            );

            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(builder: (context) => SigninPage()),
            //   (route) => false,
            // );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}