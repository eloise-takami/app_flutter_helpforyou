import 'package:flutter/material.dart';

class AudioRecordPage extends StatefulWidget {
  const AudioRecordPage({Key? key}) : super(key: key);

  @override
  _AudioRecordPageState createState() => _AudioRecordPageState();
}

class _AudioRecordPageState extends State<AudioRecordPage> {
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
      body: Container(),

      // Column(
      //   children: [
      //     Expanded(
      //       flex: 2,
      //       child: RecordListView(
      //           //records: records,
      //           ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           boxShadow: kElevationToShadow[1],
      //         ),
      //         child: RecorderView(
      //           onSaved: _onRecordComplete,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
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
