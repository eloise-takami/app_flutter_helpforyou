import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/model/usermodel.dart';
import 'package:helpforyou/services/auth_state.dart';
import 'package:provider/provider.dart';

class PageLampada extends StatefulWidget {
  final UserModel user;
  const PageLampada({Key key, this.user}) : super(key: key);
  @override
  _PageLampadaState createState() => _PageLampadaState();
}

class _PageLampadaState extends State<PageLampada> {
  // UserModel user;
  // String _name;
  // String _email;
  // String _password;
  // String _rg;
  final _inputNameController = TextEditingController();
  final _inputEmailController = TextEditingController();
  final _inputRGController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //@override
  // void initState() {
  //   super.initState();
  //   user = Provider.of<AuthState>(context).getUser;
  // }

//  UserModel user = UserModel(
//          id: widget.user.id,
//          name: _name,
//          rg: _rg,
//          email: _email,
//          password: _password,
//  );

//  void initState() {
//      super.initState();
//      _name = widget.user.name;
// _rg = widget.user.rg;
//      _email = widget.user.email;
// _password = widget.user.password;
// }

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
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print("update dados do usuário");
                },
                child: Icon(
                  Icons.check,
                  color: Color.fromRGBO(63, 71, 206, 1.0),
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
                      backgroundColor: Color.fromRGBO(62, 71, 208, 1.0),
                      child: Text(
                        'A',
                        style: GoogleFonts.breeSerif(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
              Consumer<AuthState>(
                builder: (context, userData, __) {
                  final user = userData.getUser();
                  print(user == null);
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        TextFormField(
                          controller: _inputNameController,
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
                          validator: (input) => input.trim().length < 2
                              ? 'please enter valid name'
                              : null,
                          style: TextStyle(fontSize: 18),
                          onSaved: (value) {
                            user.name = value;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _inputEmailController,
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
                            user.email = value;
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
                          controller: _inputRGController,
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
                            user.rg = value;
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
                              color: Colors.white,
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
                                    "  Para saber mais sobre os \n tipos de violências entre no \n                    nosso site",
                                    style: GoogleFonts.breeSerif(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
