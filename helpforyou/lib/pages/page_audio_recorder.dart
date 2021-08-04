import 'dart:io';
import 'package:flutter/material.dart';
import 'package:helpforyou/audio/recorded_list_view.dart';
import 'package:helpforyou/audio/recorder_view.dart';
import 'package:path_provider/path_provider.dart';

class PageAudioRecorder extends StatefulWidget {
  const PageAudioRecorder({Key? key}) : super(key: key);

  @override
  _PageAudioRecorderState createState() => _PageAudioRecorderState();
}

class _PageAudioRecorderState extends State<PageAudioRecorder> {
  // late Directory appDirectory;
  // List<String> records = [];

  // @override
  // void initState() {
  //   super.initState();
  //   getApplicationDocumentsDirectory().then((value) {
  //     appDirectory = value;
  //     appDirectory.list().listen((onData) {
  //       if (onData.path.contains('.aac')) records.add(onData.path);
  //     }).onDone(() {
  //       records = records.reversed.toList();
  //       setState(() {});
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   appDirectory.delete();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget._title'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: RecordListView(
                //records: records,
                ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: kElevationToShadow[1],
              ),
              child: RecorderView(
                onSaved: _onRecordComplete,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onRecordComplete() {
    // records.clear();
    // appDirectory.list().listen((onData) {
    //   if (onData.path.contains('.aac')) records.add(onData.path);
    // }).onDone(() {
    //   records.sort();
    //   records = records.reversed.toList();
    //   setState(() {});
    // });
  }
}
