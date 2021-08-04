import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AudioModel {
  final String path;
  final String date;
  final String name;

  const AudioModel({
    required this.path,
    required this.date,
    required this.name,
  });
}

class RecordItemStatus {
  final double progress;
  final bool isPlaying;
  final bool canResume;

  RecordItemStatus({
    this.progress = 0.0,
    this.isPlaying = false,
    this.canResume = false,
  });

  RecordItemStatus copyWith({
    double? progress,
    bool? isPlaying,
  }) {
    return RecordItemStatus(
      progress: progress ?? this.progress,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

class RecordItemController {
  final statusNotifier = ValueNotifier<RecordItemStatus>(RecordItemStatus());

  RecordItemStatus get status => statusNotifier.value;
  set status(RecordItemStatus status) => statusNotifier.value = status;

  void pause() {
    status = status.copyWith(isPlaying: false);
  }

  void play() {
    status = status.copyWith(isPlaying: true);
  }

  void setProgress(double p) {
    status = status.copyWith(progress: p);
  }
}

class RecordItem extends StatefulWidget {
  const RecordItem({Key? key, required this.audio, required this.id})
      : super(key: key);

  final AudioModel audio;
  final int id;

  @override
  _RecordItemState createState() => _RecordItemState();
}

class _RecordItemState extends State<RecordItem> {
  final controller = RecordItemController();
  final audioPlayer = AudioPlayer();

  late int duration;
  bool canPlay = false;

  @override
  void initState() {
    super.initState();

    audioPlayer.setUrl(widget.audio.path, isLocal: true).then((result) {
      if (result != 0) {
        audioPlayer.getDuration().then((d) => duration = d);
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
        final p = d.inMilliseconds / duration;
        print('$p');
        controller.setProgress(p);
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
      title: Text('New recoding ${widget.id}'),
      subtitle: Text(
        widget.audio.date,
      ),
      children: [
        // Container(
        //   height: 100,
        //   padding: const EdgeInsets.all(10),
        //child:
        ValueListenableBuilder<RecordItemStatus>(
          valueListenable: controller.statusNotifier,
          builder: (_, status, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: Colors.black.withOpacity(.4),
                  //valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  value: status.progress,
                  //_selectedIndex == i ? _completedPercentage : 0,
                ),
                IconButton(
                  icon: status.isPlaying
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                  onPressed: canPlay ? _onButtonPressed : null,
                  // => _onPlay(
                  //   filePath: audios.elementAt(i).path,
                  //   index: i,
                  // ),
                ),
              ],
            );
          },
        ),
        //),
      ],
    );
  }
}

class RecordListView extends StatefulWidget {
  const RecordListView({Key? key}) : super(key: key);

  @override
  _RecordListViewState createState() => _RecordListViewState();
}

class _RecordListViewState extends State<RecordListView> {
  // late int _totalDuration;
  // late int _currentDuration;
  // double _completedPercentage = 0.0;
  // bool _isPlaying = false;
  // int _selectedIndex = -1;

  Stream<List<AudioModel>> _audios(Stream<FileSystemEntity> source) {
    final controller = StreamController<List<AudioModel>>();
    final audios = <AudioModel>[];

    source.listen(
      (file) {
        if (file.path.contains('.aac')) {
          audios.add(
            new AudioModel(
              path: file.path,
              date: _getDateFromFilePath(filePath: file.path),
              name: 'New record',
            ),
          );
          controller.add(audios);
        }
      },
      onDone: () {
        controller.done;
        controller.close();
      },
    );

    return controller.stream;

    //final audios = <AudioModel>[];

    // await for (var file in source) {
    //   if (file.path.contains('.aac')) {
    //     audios.add(
    //       new AudioModel(
    //         path: file.path,
    //         date: _getDateFromFilePath(filePath: file.path),
    //         name: 'New record',
    //       ),
    //     );
    //     //var lines = chunk.split('\n');
    //     //lines[0] = partial + lines[0]; // Prepend partial line.
    //     //partial = lines.removeLast(); // Remove new partial line.
    //     //for (var line in lines) {
    //     yield audios; // Add lines to output stream.
    //   }
  }

  // var files = await source.toList();
  // var audios = files
  //     .where((element) => element.path.contains('.aac'))
  //     .map(
  //       (e) => AudioModel(
  //         path: e.path,
  //         date: _getDateFromFilePath(filePath: e.path),
  //         name: 'New record',
  //       ),
  //     )
  //     .toList();

  // yield audios;
  //}

  Widget _buildAudioList(List<AudioModel> audios) {
    return ListView.builder(
      itemCount: audios.length,
      //shrinkWrap: true,
      //reverse: true,
      itemBuilder: (BuildContext context, int i) {
        return RecordItem(audio: audios[i], id: i);

        // ExpansionTile(
        //   title: Text('New recoding ${audios.length - i}'),
        //   subtitle: Text(
        //     audios[i].date,
        //     // _getDateFromFilePath(
        //     //   filePath: widget.records.elementAt(i),
        //     // ),
        //   ),
        //   onExpansionChanged: ((newState) {
        //     // if (newState) {
        //     //   setState(() {
        //     //     _selectedIndex = i;
        //     //   });
        //     // }
        //   }),
        //   children: [
        //     Container(
        //       height: 100,
        //       padding: const EdgeInsets.all(10),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           LinearProgressIndicator(
        //             minHeight: 5,
        //             backgroundColor: Colors.black.withOpacity(.4),
        //             //valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        //             //value: _selectedIndex == i ? _completedPercentage : 0,
        //           ),
        //           IconButton(
        //             icon: //_selectedIndex == i
        //                 //? _isPlaying
        //                 //? Icon(Icons.pause)
        //                 //:
        //                 Icon(Icons.play_arrow),
        //             //: Icon(Icons.play_arrow),
        //             onPressed: () => _onPlay(
        //               filePath: audios.elementAt(i).path,
        //               index: i,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }

  // Future<void> _onPlay({required String filePath, required int index}) async {
  //   AudioPlayer audioPlayer = AudioPlayer();

  //   if (!_isPlaying) {
  //     audioPlayer.play(filePath, isLocal: true);
  //     setState(() {
  //       _selectedIndex = index;
  //       _completedPercentage = 0.0;
  //       _isPlaying = true;
  //     });

  //     audioPlayer.onPlayerCompletion.listen((_) {
  //       setState(() {
  //         _isPlaying = false;
  //         _completedPercentage = 0.0;
  //       });
  //     });
  //     audioPlayer.onDurationChanged.listen((duration) {
  //       setState(() {
  //         _totalDuration = duration.inMicroseconds;
  //       });
  //     });

  //     audioPlayer.onAudioPositionChanged.listen((duration) {
  //       setState(() {
  //         _currentDuration = duration.inMicroseconds;
  //         _completedPercentage =
  //             _currentDuration.toDouble() / _totalDuration.toDouble();
  //       });
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Directory>(
      future: getApplicationDocumentsDirectory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder<List<AudioModel>>(
            stream: _audios(snapshot.data!.list()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return _buildAudioList(snapshot.data!);
                } else {
                  return Center(
                    child: Text('Seus áudios aparecerão aqui'),
                  );
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

// class RecordListView extends StatefulWidget {
//   final List<String> records;
//   const RecordListView({
//     Key? key,
//     required this.records,
//   }) : super(key: key);

//   @override
//   _RecordListViewState createState() => _RecordListViewState();
// }

// class _RecordListViewState extends State<RecordListView> {
//   late int _totalDuration;
//   late int _currentDuration;
//   double _completedPercentage = 0.0;
//   bool _isPlaying = false;
//   int _selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return widget.records.isEmpty
//         ? Center(child: Text('No records yet'))
//         : ListView.builder(
//             itemCount: widget.records.length,
//             shrinkWrap: true,
//             //reverse: true,
//             itemBuilder: (BuildContext context, int i) {
//               return ExpansionTile(
//                 title: Text('New recoding ${widget.records.length - i}'),
//                 subtitle: Text(
//                   _getDateFromFilePath(
//                     filePath: widget.records.elementAt(i),
//                   ),
//                 ),
//                 onExpansionChanged: ((newState) {
//                   if (newState) {
//                     setState(() {
//                       _selectedIndex = i;
//                     });
//                   }
//                 }),
//                 children: [
//                   Container(
//                     height: 100,
//                     padding: const EdgeInsets.all(10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         LinearProgressIndicator(
//                           minHeight: 5,
//                           backgroundColor: Colors.black,
//                           valueColor:
//                               AlwaysStoppedAnimation<Color>(Colors.green),
//                           value: _selectedIndex == i ? _completedPercentage : 0,
//                         ),
//                         IconButton(
//                           icon: _selectedIndex == i
//                               ? _isPlaying
//                                   ? Icon(Icons.pause)
//                                   : Icon(Icons.play_arrow)
//                               : Icon(Icons.play_arrow),
//                           onPressed: () => _onPlay(
//                               filePath: widget.records.elementAt(i), index: i),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//   }

//   Future<void> _onPlay({required String filePath, required int index}) async {
//     AudioPlayer audioPlayer = AudioPlayer();

//     if (!_isPlaying) {
//       audioPlayer.play(filePath, isLocal: true);
//       setState(() {
//         _selectedIndex = index;
//         _completedPercentage = 0.0;
//         _isPlaying = true;
//       });

//       audioPlayer.onPlayerCompletion.listen((_) {
//         setState(() {
//           _isPlaying = false;
//           _completedPercentage = 0.0;
//         });
//       });
//       audioPlayer.onDurationChanged.listen((duration) {
//         setState(() {
//           _totalDuration = duration.inMicroseconds;
//         });
//       });

//       audioPlayer.onAudioPositionChanged.listen((duration) {
//         setState(() {
//           _currentDuration = duration.inMicroseconds;
//           _completedPercentage =
//               _currentDuration.toDouble() / _totalDuration.toDouble();
//         });
//       });
//     }
//   }

String _getDateFromFilePath({required String filePath}) {
  print('$filePath');
  //return 'date';
  String fromEpoch = filePath.substring(
      filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('.'));

  DateTime recordedDate =
      DateTime.fromMillisecondsSinceEpoch(int.parse(fromEpoch));
  int year = recordedDate.year;
  int month = recordedDate.month;
  int day = recordedDate.day;

  return ('${twoDigits(day)}-${twoDigits(month)}-$year');
}

String twoDigits(int n) => n < 9 ? '0$n' : '$n';
// }
