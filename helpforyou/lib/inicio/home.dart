import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:helpforyou/inicio/login.dart';
import 'package:helpforyou/pages/pageHome.dart';
import 'package:helpforyou/pages/pageLampada.dart';
import 'package:helpforyou/pages/pageLocal.dart';
import 'package:helpforyou/pages/pageMensagem.dart';
import 'package:helpforyou/pages/pagePessoa.dart';
import 'package:helpforyou/services/firebase/auth_service/auth_service.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

// void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
//pages
  final PageLocal _localizacao = PageLocal();
  final PageLampada _lampadapage = new PageLampada();
  final PageHome _homepage = new PageHome();
  final PagePessoa _pessoapage = new PagePessoa();
  final PageMensagem _mensagempage = new PageMensagem();

  Widget _showPage = new PageLocal();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        print("pagina feed");
        return _pessoapage;
        break;
      case 1:
        print("pagina lampada");
        return _lampadapage;
        break;
      case 2:
        print("pagina home");
        return _homepage;
        break;
      case 3:
        print("pagina localização");
        return _localizacao;
        break;

      case 4:
        print("pagina mensagens");
        return _mensagempage;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              "No page found by page chooser",
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.people_alt_sharp,
            size: 30,
            color: Cor.roxo,
          ),
          Icon(
            Icons.lightbulb,
            size: 30,
            color: Cor.roxo, //Color.fromRGBO(62, 71, 208, 1.0),
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Cor.roxo,
          ),
          Icon(
            Icons.location_on,
            size: 30,
            color: Cor.roxo,
          ),
          Icon(
            Icons.messenger_outlined,
            size: 30,
            color: Cor.roxo,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Cor.azul_claro,
        backgroundColor: Cor.azul_claro,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Cor.azul_claro,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
