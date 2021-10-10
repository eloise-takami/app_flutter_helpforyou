import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Lista de pontos adicionados ao clicar na tela <LatLng>
  List<LatLng> tappedPoints = [];

// funcao que atualiza o estado do mapa e salva a coordenada na lista tappedPoints.
  void _handleTap(LatLng latlng) {
    setState(() {
      print(latlng);
      tappedPoints.add(latlng);
    });
  }

  @override
  Widget build(BuildContext context) {
    var markers = tappedPoints.map((latlng) {
      return Marker(
        // dimensao dos marcadores
        width: 80.0,
        height: 80.0,
        // coordenadas do marcadores.
        point: latlng,
        builder: (ctx) => GestureDetector(
          onTap: () {
            // Mostrar uma SnackBar quando clicar em um marcador
            Scaffold.of(ctx).showSnackBar(SnackBar(
                content: Text("Latitude =" +
                    latlng.latitude.toString() +
                    " :: Longitude = " +
                    latlng.longitude.toString())));
          },
          child: Container(
            child: Icon(
              // Icone do marcador
              Icons.pin_drop,
              color: Color.fromRGBO(62, 71, 208, 1.0),
            ),
          ),
        ),
      );
    }).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Container(
            // margin: EdgeInsets.all(16),
            //padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: AppColors.branco,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.roxo,
                ),
                hintText: " Procurar Ponto de Apoio mais próximo",
                hintStyle: TextStyle(
                  color: AppColors.roxo,
                ),
              ),
            ),
          ),
          //Text("Encontre uma delegacia próxima de você:"),
        ),
        body: FlutterMap(
          options: MapOptions(
              // Coordenada central do mapa.
              center: LatLng(-22.7617, -47.1541),
              // Quantidade de zoom do mapa.
              zoom: 17,
              onTap: _handleTap),
          layers: [
            // Url do mapa.
            TileLayerOptions(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(-22.764797, -47.15062),
                  builder: (ctx) => Container(
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Color.fromRGBO(62, 71, 208, 1.0),
                      iconSize: 45.0,
                      onPressed: () {
                        print("icone delegacia da policia paulinia");
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),

                                  // boxShadow: [
                                  //   new BoxShadow(
                                  //     color: Colors.grey,
                                  //     blurRadius: 20,
                                  //   ),
                                  // ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      color: Color.fromRGBO(62, 71, 208, 1.0),
                                      height: 90,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          "Delegacia da polícia de Paulínia",
                                          style: GoogleFonts.breeSerif(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50),
                                            ),
                                          ),
                                          height: 70,
                                          width: 20,
                                          child: Icon(
                                            Icons.phone,
                                            color: Color.fromRGBO(
                                                62, 71, 208, 1.0),
                                            size: 50,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '          Telefone: (19) 3874-1411',
                                          style: GoogleFonts.breeSerif(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          height: 70,
                                          width: 10,
                                          child: Icon(
                                            Icons.location_on,
                                            color: Color.fromRGBO(
                                                62, 71, 208, 1.0),
                                            size: 50,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '          Av. José Paulino, 1406 - Nova Paulínia, \n          Paulínia - SP, 13140-000',
                                          style: GoogleFonts.breeSerif(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          height: 70,
                                          width: 10,
                                          child: Icon(
                                            Icons.access_time_sharp,
                                            color: Color.fromRGBO(
                                                62, 71, 208, 1.0),
                                            size: 50,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '          Aberto 24 horas',
                                          style: GoogleFonts.breeSerif(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Image(image: AssetImage("assets/images/del_pol_paulinia.jpg"),
                                    // height: 30,
                                    // ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ),
                ),
                Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-22.918664, -47.106293),
                    builder: (ctx) => Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Color.fromRGBO(62, 71, 208, 1.0),
                            iconSize: 45.0,
                            onPressed: () {
                              print("icone delegacia da policia paulinia");
                              showModalBottomSheet(
                                  context: context,
                                  builder: (builder) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                        // boxShadow: [
                                        //   new BoxShadow(
                                        //     color: Colors.grey,
                                        //     blurRadius: 20,
                                        //   ),
                                        // ],
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Color.fromRGBO(
                                                62, 71, 208, 1.0),
                                            height: 90,
                                            width: double.infinity,
                                            child: Center(
                                              child: Text(
                                                "   2ª Delegacia de Defesa da Mulher de \n   Campinas",
                                                style: GoogleFonts.breeSerif(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                height: 70,
                                                width: 10,
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Color.fromRGBO(
                                                      62, 71, 208, 1.0),
                                                  size: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                '          Telefone: (19) 3227-0080',
                                                style: GoogleFonts.breeSerif(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                height: 70,
                                                width: 10,
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Color.fromRGBO(
                                                      62, 71, 208, 1.0),
                                                  size: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                '          R. Ferdinando Panattoni, 590 - Jardim \n          Pauliceia, Campinas - SP, 13060-090',
                                                style: GoogleFonts.breeSerif(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                height: 70,
                                                width: 10,
                                                child: Icon(
                                                  Icons.access_time_sharp,
                                                  color: Color.fromRGBO(
                                                      62, 71, 208, 1.0),
                                                  size: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                '          Aberto 24 horas',
                                                style: GoogleFonts.breeSerif(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Image(image: AssetImage("assets/images/del_pol_paulinia.jpg"),
                                          // height: 30,
                                          // ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                        )),
                Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-22.921658, -47.043376),
                    builder: (ctx) => Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Color.fromRGBO(62, 71, 208, 1.0),
                            iconSize: 45.0,
                            onPressed: () {
                              print("icone delegacia da policia paulinia");
                              showModalBottomSheet(
                                  context: context,
                                  builder: (builder) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                        // boxShadow: [
                                        //   new BoxShadow(
                                        //     color: Colors.grey,
                                        //     blurRadius: 20,
                                        //   ),
                                        // ],
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Color.fromRGBO(
                                                62, 71, 208, 1.0),
                                            height: 90,
                                            width: double.infinity,
                                            child: Center(
                                              child: Text(
                                                "   1ª Delegacia de Defesa da Mulher de \n   Campinas",
                                                style: GoogleFonts.breeSerif(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                height: 70,
                                                width: 10,
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Color.fromRGBO(
                                                      62, 71, 208, 1.0),
                                                  size: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                '          Telefone: (19) 3242-5003',
                                                style: GoogleFonts.breeSerif(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                height: 70,
                                                width: 10,
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Color.fromRGBO(
                                                      62, 71, 208, 1.0),
                                                  size: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                '          Av. Dr. Antônio Carlos Sáles Júnior, \n          310 - Jardim Proenca I, Campinas - SP,\n          13100-410',
                                                style: GoogleFonts.breeSerif(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                height: 70,
                                                width: 10,
                                                child: Icon(
                                                  Icons.access_time_sharp,
                                                  color: Color.fromRGBO(
                                                      62, 71, 208, 1.0),
                                                  size: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                '          Aberto das 9:00 as 17:00',
                                                style: GoogleFonts.breeSerif(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Image(image: AssetImage("assets/images/del_pol_paulinia.jpg"),
                                          // height: 30,
                                          // ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                        ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
