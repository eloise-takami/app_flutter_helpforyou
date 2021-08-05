import 'package:flutter/material.dart';
import 'package:helpforyou/modules/audio_record/player/player_widget.dart';
import 'package:helpforyou/services/database/database_service.dart';
import 'package:helpforyou/shared/models/audio_model.dart';

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
            return Center(child: Text('Ops, algo deu errado.'));
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
              return Center(child: Text('Seus áudios aparecerão aqui'));
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
