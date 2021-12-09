import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Noticias extends StatefulWidget {
  const Noticias({Key? key}) : super(key: key);

  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      print('erro $url');
    }
  }

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
                        'Veja notícias sobre violência\n                contra mulher',
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
                      Image.asset("assets/images/7.png", height: 280)
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
                                      _launchLink(
                                          'https://www.institutomariadapenha.org.br/quem-e-maria-da-penha.html');
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/maria.JPG',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 115,
                                          ),
                                          Container(
                                            height: 55,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: AppColors.branco,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                            ),
                                            child: Text(
                                              "                                                                        Quem é maria da penha?",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.breeSerif(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w900,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
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
                                      _launchLink(
                                          'https://g1.globo.com/fantastico/noticia/2021/10/03/tj-do-rio-de-janeiro-faz-mutirao-para-acelerar-11-mil-processos-de-violencia-contra-a-mulher.ghtml');
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                            alignment: Alignment.topCenter,
                                            image: AssetImage(
                                              'assets/images/ana.jpg',
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 115,
                                          ),
                                          Container(
                                            height: 55,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: AppColors.branco,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                            ),
                                            child: Text(
                                              "TJ do Rio de Janeiro faz mutirão \npara acelerar 11 mil processos de violência contra a mulher",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.breeSerif(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w900,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
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
                                      _launchLink(
                                          'https://g1.globo.com/jornal-nacional/noticia/2021/09/23/lei-inclui-aulas-de-prevencao-da-violencia-contra-a-mulher-na-educacao-basica.ghtml');
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/saladeaula.jpeg',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 115,
                                          ),
                                          Container(
                                            height: 55,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: AppColors.branco,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                            ),
                                            child: Text(
                                              "Lei inclui aulas de prevenção da violência contra a mulher na Educação Básica",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.breeSerif(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w900,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
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
                                      _launchLink(
                                          'https://ibdfam.org.br/noticias/8560');
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/violencia sexual.jpg',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 115,
                                          ),
                                          Container(
                                            height: 55,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: AppColors.branco,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                            ),
                                            child: Text(
                                              "Cerca de 17 milhões de mulheres foram vítimas de violência no Brasil em 2020, segundo Datafolha",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.breeSerif(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w900,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
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
                                      _launchLink(
                                          'https://g1.globo.com/politica/noticia/2021/03/07/brasil-teve-105-mil-denuncias-de-violencia-contra-mulher-em-2020-pandemia-e-fator-diz-damares.ghtml');
                                    },
                                    child: Container(
                                      height: 170,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: AppColors.branco,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                            'assets/images/violenciamoral.jpg',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 115,
                                          ),
                                          Container(
                                            height: 55,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: AppColors.branco,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                            ),
                                            child: Text(
                                              "Brasil teve 105 mil denúncias de violência contra mulher em 2020; pandemia é fator, diz Damares",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.breeSerif(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w900,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
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
