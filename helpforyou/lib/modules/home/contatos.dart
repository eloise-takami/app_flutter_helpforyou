import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class Contatos extends StatefulWidget {
  const Contatos({Key? key}) : super(key: key);

  @override
  _ContatosState createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: AppColors.roxo,
      ),
      body: Container(
        color: AppColors.roxo,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              "Adicione contatos de emergência",
              textAlign: TextAlign.center,
              style: GoogleFonts.breeSerif(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 611,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.branco,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    //topRight: Radius.circular(24)
                  )),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Nome:",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Telefone:",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 45,
                    width: 115,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.2, 1],
                        colors: [AppColors.roxo, AppColors.roxo],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Adicionar",
                              style: GoogleFonts.breeSerif(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
