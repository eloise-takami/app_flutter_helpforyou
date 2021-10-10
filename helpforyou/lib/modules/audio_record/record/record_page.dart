import 'package:flutter/material.dart';
// import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:helpforyou/shared/animations/ripple_animation_button.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

// import 'record_controller.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  // final _controller = RecordController();

  // @override
  // void initState() {
  //   super.initState();

  //   _controller.init(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo áudio'),
      ),
      body: Container(),

      // ValueListenableBuilder<RecordingStatus>(
      //   valueListenable: _controller.statusNotifier,
      //   builder: (_, status, __) {
      //     return Column(
      //       children: [
      //         Expanded(
      //           child: status.recording
      //               ? Center(
      //                   child: Text('Gravando...'),
      //                 )
      //               : Container(),
      //         ),
      //         RippleAnimationButton(
      //           color: status.loading ? Colors.grey : AppColors.roxo,
      //           onPressed: () {
      //             if (!status.loading) {
      //               _controller.onButtonPressed(context);
      //             }
      //           },
      //         ),
      //         Expanded(
      //           child: status.loading
      //               ? Center(
      //                   child: CircularProgressIndicator(),
      //                 )
      //               : Container(),
      //         ),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
