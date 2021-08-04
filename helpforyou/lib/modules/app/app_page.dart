import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:helpforyou/modules/chat/chat_page.dart';
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
  final _pages = <Widget>[
    FeedPage(),
    RegistrationDataPage(),
    HomePage(),
    MapPage(),
    ChatPage(),
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
    );
  }

  Widget _iconNavigatorMenu(IconData iconData) => Icon(
        iconData,
        size: 30,
        //color: AppColors.roxo,
      );
}
