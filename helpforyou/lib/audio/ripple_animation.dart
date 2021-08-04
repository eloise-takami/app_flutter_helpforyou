import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'circle_painter.dart';
import 'curve_wave.dart';
import 'recorder_view.dart';
import 'package:path_provider/path_provider.dart';
import 'recorded_list_view.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({
    Key? key,
    this.size = 80.0,
    this.color = AppColors.roxo, //Colors.purpleAccent,
    required this.onPressed,
    //required this.child,
  }) : super(key: key);

  final double size;
  final Color color;
  //final Widget child;
  final VoidCallback onPressed;

  @override
  _RippleAnimationState createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with TickerProviderStateMixin {
  //late Directory appDirectory;
  List<String> records = [];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    ); //..repeat();

    // getApplicationDocumentsDirectory().then((value) {
    //   appDirectory = value;
    //   appDirectory.list().listen((onData) {
    //     if (onData.path.contains('.aac')) records.add(onData.path);
    //   }).onDone(() {
    //     records = records.reversed.toList();
    //     setState(() {});
    //   });
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    //appDirectory.delete();
    super.dispose();
  }

  // Widget _button() {
  //   return Center(
  //     child: GestureDetector(
  //       onTap: () {
  //         //funcao parar de gravar
  //         print("audio finalizado");
  //       },
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(widget.size),
  //         child: DecoratedBox(
  //           decoration: BoxDecoration(
  //             gradient: RadialGradient(
  //               colors: <Color>[
  //                 widget.color,
  //                 AppColors.roxo,
  //                 //Color.lerp(widget.color, Colors.black, .05),
  //               ],
  //             ),
  //           ),
  //           child: ScaleTransition(
  //             scale: Tween(begin: 0.95, end: 1.0).animate(
  //               CurvedAnimation(
  //                 parent: _controller,
  //                 curve: const CurveWave(),
  //               ),
  //             ),
  //             child: Icon(
  //               Icons.keyboard_voice,
  //               size: 44,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text("Gravando áudio..."),
        //     backgroundColor: AppColors.roxo,
        //   ),
        //   body:
        Center(
      child: CustomPaint(
        painter: CirclePainter(
          _controller,
          color: widget.color,
        ),
        child: SizedBox(
          width: 200, //widget.size * 4.125,
          height: 200, //widget.size * 4.125,
          child: Center(
            // child: GestureDetector(
            //   onTap: () {
            //     //funcao parar de gravar
            //     //print("audio finalizado");

            //     if (_controller.isAnimating) {
            //       _controller.stop();
            //     } else {
            //       _controller.repeat();
            //     }

            //     widget.onPressed();
            //   },
            //child: ClipRRect(
            //borderRadius: BorderRadius.circular(widget.size),
            // child: DecoratedBox(
            //   decoration: BoxDecoration(
            //     gradient: RadialGradient(
            //       colors: <Color>[
            //         widget.color,
            //         AppColors.roxo,
            //         //Color.lerp(widget.color, Colors.black, .05),
            //       ],
            //     ),
            //   ),
            // child: ScaleTransition(
            //   scale: Tween(begin: 0.95, end: 1.0).animate(
            //     CurvedAnimation(
            //       parent: _controller,
            //       curve: const CurveWave(),
            //     ),
            //   ),
            child: TextButton(
              onPressed: () {
                //funcao parar de gravar
                //print("audio finalizado");

                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat();
                }

                widget.onPressed();
              },
              style: TextButton.styleFrom(
                backgroundColor: widget.color,
                shape: CircleBorder(),
              ),
              child: Icon(
                Icons.keyboard_voice,
                size: 56,
                color: Colors.white,
              ),
            ),
            //),
          ),
        ),
      ),
      //),

      //_button(),
      //),
      //),
      // ),
    );
  }
}
