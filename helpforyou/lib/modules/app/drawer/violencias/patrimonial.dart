import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class PageVpatrimonial extends StatefulWidget {
  const PageVpatrimonial({Key? key}) : super(key: key);

  @override
  _PageVpatrimonialState createState() => _PageVpatrimonialState();
}

class _PageVpatrimonialState extends State<PageVpatrimonial> {
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
              'assets/images/3.png',
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
                      height: 20,
                    ),
                    Text(
                      "Violência patrimonial",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: AppColors.roxo,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '> Quando o agressor destrói bens, documentos pessoais, de trabalho e recursos econômicos necessários a mulher.',
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
