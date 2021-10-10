import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class PageVpsicologica extends StatefulWidget {
  const PageVpsicologica({Key? key}) : super(key: key);

  @override
  _PageVpsicologicaState createState() => _PageVpsicologicaState();
}

class _PageVpsicologicaState extends State<PageVpsicologica> {
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
              'assets/images/Gender violence-rafiki.png',
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
                      "Violência psicológica",
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
                      '>  Ações que causem danos psicológicos, como humilhação, chantagem, insulto, isolamento e ridicularização.',
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '> Além disso, formas de controle sobre o comportamento da mulher, como impedi-la de sair, enquadra na definição.',
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 18,
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
