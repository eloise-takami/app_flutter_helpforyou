import 'package:flutter/material.dart';
import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

import '../../../app_routes.dart';

class Camuflado extends StatefulWidget {
  const Camuflado({Key? key}) : super(key: key);

  @override
  _CamufladoState createState() => _CamufladoState();
}

class _CamufladoState extends State<Camuflado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.branco,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Cuide-se",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Detalhes",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 210,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.roxo, Colors.cyan],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.3)),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Acompanhe',
                      style: TextStyle(fontSize: 16, color: AppColors.branco),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Seu ciclo menstrual',
                      style: TextStyle(fontSize: 25, color: AppColors.branco),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColors.branco,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Semanal",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.branco),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () async {
                            final response = await AuthService.logout();
                            if (response) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.signin,
                                (route) => false,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ],
                            ),
                            child: Icon(
                              Icons.play_circle_fill,
                              color: AppColors.branco,
                              size: 60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.branco,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: AssetImage(
                          'assets/images/borda.png',
                        ),
                        fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 40,
                          offset: Offset(8, 10)),
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1, -5),
                          color: Colors.black.withOpacity(0.3))
                    ],
                  ),
                ),
                Container(
                  height: 84,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      right: 180, bottom: 15, top: 6, left: 1),
                  decoration: BoxDecoration(
                      //color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/6.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 170, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'O uso dos métodos\n contraceptivos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "     Saiba mais",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.roxo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Como foi seu dia?",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Suas emoções",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      EdgeInsets.only(top: 10, left: 5, right: 30, bottom: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 160,
                          width: 140,
                          decoration: BoxDecoration(
                            color: AppColors.branco,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage(
                                'assets/images/feliz.png',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(4, 8))
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                              ),
                              Text(
                                "Feliz",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 160,
                          width: 140,
                          decoration: BoxDecoration(
                            color: AppColors.branco,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage(
                                'assets/images/nuvem.png',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(4, 8))
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                              ),
                              Text(
                                "Triste",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 160,
                          width: 140,
                          decoration: BoxDecoration(
                            color: AppColors.branco,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage(
                                'assets/images/triste.png',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(4, 8))
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                              ),
                              Text(
                                "Sensível",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.roxo,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 160,
                          width: 140,
                          decoration: BoxDecoration(
                            color: AppColors.branco,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage(
                                'assets/images/bravo.png',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(4, 8))
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                              ),
                              Text(
                                "Irritada",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.roxo,
                                    fontWeight: FontWeight.w700),
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
    );
  }
}
