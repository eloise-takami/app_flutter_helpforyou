import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/modules/audio_record/player/player_widget.dart';
import 'package:helpforyou/services/database/database_service.dart';
import 'package:helpforyou/shared/models/audio_model.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:helpforyou/shared/themes/app_images.dart';

import 'record/record_page.dart';

class AudioRecordPage extends StatefulWidget {
  const AudioRecordPage({Key? key}) : super(key: key);

  @override
  _AudioRecordPageState createState() => _AudioRecordPageState();
}

class _AudioRecordPageState extends State<AudioRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus áudios'),
      ),
      body: FutureBuilder<List<AudioModel>>(
        future: DatabaseService.audios(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Ops, algo deu errado ao procurar seus áudios :(',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: AppColors.roxo,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(Imagem.erro),
                    ),
                  ],
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            final audios = snapshot.data!;

            if (audios.isNotEmpty) {
              return ListView.builder(
                itemCount: audios.length,
                itemBuilder: (context, index) =>
                    PlayerWidget(audio: audios[index]),
              );
            } else {
              return Scaffold(
                body: Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      Center(
                        child: Text(
                          'Seus áudios aparecerão aqui',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.breeSerif(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: AppColors.roxo,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: Image.asset(
                          Imagem.firebase_vazio,
                          height: 500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecordPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
