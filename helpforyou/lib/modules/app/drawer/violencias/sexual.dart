import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class PageVsexual extends StatefulWidget {
  const PageVsexual({Key? key}) : super(key: key);

  @override
  _PageVsexualState createState() => _PageVsexualState();
}

class _PageVsexualState extends State<PageVsexual> {
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
              'assets/images/4.png',
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
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
                      "Violência sexual",
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
                      height: 20,
                    ),
                    Text(
                      '> Forçar a mulher a participar de relação sexual não desejada.',
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
                      '> Intimidação de qualquer natureza: ameaça, coação ou uso da força.',
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
                      '> Também impedir que a mulher faça uso de métodos contraceptivos.',
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
                      '> Forçá-la a se casar, engravidar, abortar ou se prostituir.',
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
