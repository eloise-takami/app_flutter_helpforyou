import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class PageVfisica extends StatefulWidget {
  const PageVfisica({Key? key}) : super(key: key);

  @override
  _PageVfisicaState createState() => _PageVfisicaState();
}

class _PageVfisicaState extends State<PageVfisica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.roxo,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.roxo,
        ),
        body: Column(children: <Widget>[
          Center(
            child: Image.asset(
              'assets/images/2.png',
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.branco,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Violência fisíca",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: AppColors.roxo,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '> São atos nos quais se fez uso da força física de forma intencional.',
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '> Com o objetivo de ferir, lesar, provocar dor e sofrimento ou destruir a pessoa, deixando,ou não, marcas evidentes no seu corpo.',
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )),
          ),
        ]));
  }
}
