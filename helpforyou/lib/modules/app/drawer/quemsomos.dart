import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class PageQuemSomos extends StatefulWidget {
  const PageQuemSomos({Key? key}) : super(key: key);

  @override
  _PageQuemSomosState createState() => _PageQuemSomosState();
}

class _PageQuemSomosState extends State<PageQuemSomos> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.branco,
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/anaEelo.jpeg'),
                      fit: BoxFit.cover)),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.branco,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.45),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.branco),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Quem somos',
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Em 2019 começamos o curso Técnico de informática, no Centro Municipal de Ensino Profissionalizante (CEMEP) em Paulínia. Nele aprendemos várias linguagens de programação como: java, python, C#, C++, portugol, PHP, HTML. Com isso juntamos nossos conhecimentos para fazer um Aplicativo Móbile para o combate à violência da mulher com o Flutter.',
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
