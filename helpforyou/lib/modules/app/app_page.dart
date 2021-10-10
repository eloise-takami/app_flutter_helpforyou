import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/modules/app/drawer/noticias.dart';
import 'package:helpforyou/modules/app/drawer/quemsomos.dart';
import 'package:helpforyou/modules/app/drawer/violencias.dart';
import 'package:helpforyou/modules/chat/chats_page.dart';
import 'package:helpforyou/modules/feed/feed_page.dart';
import 'package:helpforyou/modules/home/home_page.dart';
import 'package:helpforyou/modules/map/map_page.dart';
import 'package:helpforyou/modules/registration_data/registration_data_page.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  bool switchState = false;
  final _pages = <Widget>[
    FeedPage(),
    RegistrationDataPage(),
    HomePage(),
    MapPage(),
    ChatsPage(),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        height: 50.0,
        items: <Widget>[
          _iconNavigatorMenu(Icons.people_alt_sharp),
          _iconNavigatorMenu(Icons.lightbulb),
          _iconNavigatorMenu(Icons.home),
          _iconNavigatorMenu(Icons.location_on),
          _iconNavigatorMenu(Icons.messenger_outlined),
        ],
        color: Colors.white,
        buttonBackgroundColor: AppColors.azulClaro,
        backgroundColor: AppColors.azulClaro,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _pageIndex = tappedIndex;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: AppColors.azulClaro,
        child: Center(
          child: _pages[_pageIndex],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Modo camuflado',
              textAlign: TextAlign.center,
              style: GoogleFonts.breeSerif(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 43,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(color: AppColors.roxo),
          ),
          ListTile(
            subtitle: Text(
              "Se você estiver em uma situação de violência, ative o modo camuflado como disfarce do app.",
              textAlign: TextAlign.center,
              style: GoogleFonts.breeSerif(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          CupertinoSwitch(
              value: switchState,
              onChanged: (bool value) {
                setState(() {
                  switchState = value;
                });
              }),
          SizedBox(
            height: 235,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          ListTile(
            leading: Container(
              child: Icon(Icons.lightbulb, color: AppColors.roxo),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.roxo.withOpacity(0.09),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            title: Text(
              'Tipos de violências',
              textAlign: TextAlign.left,
              style: GoogleFonts.breeSerif(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: AppColors.roxo,
            ),
            onTap: () {
              print("pagina violencia");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TiposdeViolenciasPage()),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              child:
                  Icon(Icons.chrome_reader_mode_rounded, color: AppColors.roxo),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.roxo.withOpacity(0.09),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            title: Text(
              'Notícias',
              textAlign: TextAlign.left,
              style: GoogleFonts.breeSerif(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: AppColors.roxo,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Noticias()),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              child: Icon(Icons.person, color: AppColors.roxo),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.roxo.withOpacity(0.09),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            title: Text(
              'Quem somos',
              textAlign: TextAlign.left,
              style: GoogleFonts.breeSerif(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: AppColors.roxo,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageQuemSomos()),
              );
            },
          ),
        ],
      )),
    );
  }

  Widget _iconNavigatorMenu(IconData iconData) => Icon(
        iconData,
        size: 30,
        color: AppColors.roxo,
      );
}
