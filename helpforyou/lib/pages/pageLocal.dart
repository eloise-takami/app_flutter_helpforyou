import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/themes/app_images.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(PageLocal());

class PageLocal extends StatefulWidget {
  @override
  _PageLocalState createState() => _PageLocalState();
}

class _PageLocalState extends State<PageLocal> {
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
          title: Image(
            image: AssetImage(Imagem.logo_h),
            width: 35.0,
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
                                color: Colors.white,
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
                                        )),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Widget _montarIcon(Icon icon){
//   Icon icon;
//   return Container(
//         color: Colors.cyan[100],
//         height: 70,
//         width: 10,
//         icon: icon,
//         child: Icon(
//           icon, 
//           color:Color.fromRGBO(62,71,208,1.0),
//           size:50,
//         ),
//   );
// }