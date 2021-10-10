import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class PageVmoral extends StatefulWidget {
  const PageVmoral({Key? key}) : super(key: key);

  @override
  _PageVmoralState createState() => _PageVmoralState();
}

class _PageVmoralState extends State<PageVmoral> {
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
              'assets/images/1.png',
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
                      height: 30,
                    ),
                    Text(
                      "Violência moral",
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
                      height: 50,
                    ),
                    Text(
                      '> É considerada qualquer conduta que configure calunia, difamação e injuria contra a vítima. ',
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
