import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:helpforyou/shared/models/audio_model.dart';
import 'package:helpforyou/shared/utils/date_time_format.dart';

import 'player_controller.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({Key? key, required this.audio}) : super(key: key);

  final AudioModel audio;

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final controller = PlayerController();
  final audioPlayer = AudioPlayer();
  bool canPlay = false;

  @override
  void initState() {
    super.initState();

    // local audio
    // audioPlayer.setUrl(widget.audio.localPath, isLocal: true).then((result) {

    audioPlayer.setUrl(widget.audio.url, isLocal: false).then((result) {
      if (result != 0) {
        setState(() {
          canPlay = true;
        });
      }
    });
  }

  void _onButtonPressed() async {
    if (controller.status.isPlaying) {
      audioPlayer.pause();
      controller.pause();
    } else {
      audioPlayer.resume();
      controller.play();

      audioPlayer.onAudioPositionChanged.listen((d) {
        final p = d.inMilliseconds / widget.audio.durationInMilliseconds;

        print('$p');
        controller.setProgress(min<double>(p, 1));
      });

      audioPlayer.onPlayerCompletion.listen((_) {
        controller.setProgress(0);
        controller.pause();
      });
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.audio.name),
      subtitle: Text(
        DateTimeFormat.dateAndTime(widget.audio.date), //.toString(),
      ),
      children: [
        ValueListenableBuilder<PlayerStatus>(
          valueListenable: controller.statusNotifier,
          builder: (_, status, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: Colors.black.withOpacity(.4),
                  value: status.progress,
                ),
                IconButton(
                  icon: status.isPlaying
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                  onPressed: canPlay ? _onButtonPressed : null,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
