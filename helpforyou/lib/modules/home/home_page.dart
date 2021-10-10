import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/app_routes.dart';
import 'package:helpforyou/modules/home/imagem.dart';
import 'package:helpforyou/modules/home/contatos/vercontato.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:helpforyou/shared/widgets/my_clipper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  launchApp(String url, BuildContext context) async {
    await canLaunch(url)
        ? await launch(url)
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alerta!'),
                content: Text('Não foi possivel um app compativel.'),
              );
            },
          );
  }
  // launchApp(String url, BuildContext context) async {
  //   await canLaunch(url)
  //       ? await launch(url)
  //       : showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: Text('Alerta!'),
  //               content: Text('Não foi possivel acessar seus contatos.'),
  //             );
  //           },
  //         );
  // }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Não foi possível acessar seus contatos."),
        ),
      );
    }
  }
  // Future<void> _makePhoneCall(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Não foi possível acessar seus contatos."),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 267,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.cyan[700]!,
                    Color.fromRGBO(110, 71, 190, 1.0),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  //Positioned(
                  // top: 100,
                  //left: 300,
                  Center(
                    child: Text(
                      "Corra, abra e\nreporte!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.cyan[50],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 20),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            print("botao policia");
                            launchApp("tel:190", context);
                          },
                          child: Container(
                            height: 93,
                            width: 93,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
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
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Color.fromRGBO(62, 71, 208, 1.0),
                                  size: 50,
                                ),
                                SizedBox(height: 1),
                                Text(
                                  ' Ligar para \n     policia',
                                  style: GoogleFonts.breeSerif(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("botao gravador de voz");

                            Navigator.pushNamed(
                                context, AppRoutes.audio_record);

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => AudioRecordPage(),
                            //   ),
                            // );
                          },
                          child: Container(
                            height: 93,
                            width: 93,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
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
                              children: [
                                Icon(
                                  Icons.keyboard_voice,
                                  color: Color.fromRGBO(62, 71, 208, 1.0),
                                  size: 50,
                                ),
                                SizedBox(height: 1),
                                Text(
                                  ' Gravador de \n          voz ',
                                  style: GoogleFonts.breeSerif(
                                    textStyle:
                                        Theme.of(context).textTheme.headline4,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("botao reporte");
                            //_sendSMS(
                            //"Help for you: A usuária _ mandou um pedido de socorro. Entre em contato. ",
                            //recipents);
                            //launchApp("sms:19991731950?body=Estou em perigo!", context);

                            launchApp(
                                "sms:19991731950?body=Estou em perigo!preciso de ajuda, segue a minha localização:http://maps.google.com/maps?q=-22.7998%2C-47.14602",
                                context);
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    title:
                                        Text("Mensagem enviada com sucesso!"),
                                    actions: <Widget>[
                                      RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        color: AppColors.roxo,
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: AppColors.branco),
                                        ),
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            height: 93,
                            width: 93,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
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
                              children: [
                                Icon(
                                  Icons.report_problem,
                                  color: Color.fromRGBO(62, 71, 208, 1.0),
                                  size: 50,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Reporte',
                                  style: GoogleFonts.breeSerif(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('foto');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Imagem()),
                            );
                          },
                          child: Container(
                            height: 93,
                            width: 93,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
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
                              children: [
                                Icon(
                                  Icons.photo,
                                  color: Color.fromRGBO(62, 71, 208, 1.0),
                                  size: 50,
                                ),
                                SizedBox(height: 1),
                                Text(
                                  ' Baixe fotos \n       aqui!',
                                  style: GoogleFonts.breeSerif(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("botao central de atendimento a mulher");
                            //Navigator.push(context,
                            //MaterialPageRoute(builder: fazerLigacao()));
                            launchApp("tel:180", context);
                          },
                          child: Container(
                            height: 93,
                            width: 93,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
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
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Color.fromRGBO(62, 71, 208, 1.0),
                                  size: 50,
                                ),
                                SizedBox(height: 1),
                                Text(
                                  ' Ligar para \n         180',
                                  style: GoogleFonts.breeSerif(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "       *Só ligue para a polícia em caso de extrema emergência! ",
                    style: GoogleFonts.breeSerif(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(62, 71, 208, 1.0),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 15,
                  ),
                  Container(
                    height: 150,
                    width: 100000,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: new Border.all(
                          color: Color.fromRGBO(63, 71, 206, 1.0), width: 4),
                      color: Colors.cyan[50],
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "      Contatos de emergência ",
                          style: GoogleFonts.breeSerif(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(63, 71, 206, 1.0),
                          ),
                        ),
                        Text(
                            "     Adicione alguém para enviar pedidos de socorro.",
                            style: GoogleFonts.breeSerif(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(63, 71, 206, 1.0),
                            )),
                        SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("botao adicionar");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerContatos()),
                            );
                          },
                          child: Center(
                            child: Container(
                              height: 45,
                              width: 100,
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              alignment: Alignment.topCenter,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: new Border.all(
                                    color: Color.fromRGBO(63, 71, 206, 1.0),
                                    width: 4),
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
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Adicionar',
                                    style: GoogleFonts.breeSerif(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
