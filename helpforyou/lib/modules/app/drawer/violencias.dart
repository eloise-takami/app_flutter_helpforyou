import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/modules/app/drawer/violencias/fisica.dart';
import 'package:helpforyou/modules/app/drawer/violencias/moral.dart';
import 'package:helpforyou/modules/app/drawer/violencias/patrimonial.dart';
import 'package:helpforyou/modules/app/drawer/violencias/psicologica.dart';
import 'package:helpforyou/modules/app/drawer/violencias/sexual.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class TiposdeViolenciasPage extends StatefulWidget {
  const TiposdeViolenciasPage({Key? key}) : super(key: key);

  @override
  _TiposdeViolenciasPageState createState() => _TiposdeViolenciasPageState();
}

class _TiposdeViolenciasPageState extends State<TiposdeViolenciasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.branco,
        appBar: AppBar(
          title: Text(""),
          elevation: 0,
          backgroundColor: AppColors.roxo,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Saiba sobre os tipos de violências\n                    contra mulher',
                        style: GoogleFonts.breeSerif(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          color: AppColors.roxo,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Image.asset("assets/images/6.png", height: 280)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: AppColors.roxo,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(48),
                          topRight: Radius.circular(48))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                            ]),
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PageVfisica()),
                                      );
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/2.png',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 135,
                                          ),
                                          Text(
                                            "Violência Física",
                                            style: GoogleFonts.breeSerif(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PageVpatrimonial()),
                                      );
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/3.png',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 140,
                                          ),
                                          Text(
                                            "Violência patrimonial",
                                            style: GoogleFonts.breeSerif(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PageVpsicologica()),
                                      );
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/Gender violence-rafiki.png',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 135,
                                          ),
                                          Text(
                                            "Violência psicológica",
                                            style: GoogleFonts.breeSerif(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PageVsexual()));
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/4.png',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 135,
                                          ),
                                          Text(
                                            "Violência sexual",
                                            style: GoogleFonts.breeSerif(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PageVmoral()));
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/1.png',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 135,
                                          ),
                                          Text(
                                            "Violência moral",
                                            style: GoogleFonts.breeSerif(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
