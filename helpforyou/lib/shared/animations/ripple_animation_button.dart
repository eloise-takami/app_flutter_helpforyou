import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import '../widgets/circle_painter.dart';

class RippleAnimationButton extends StatefulWidget {
  const RippleAnimationButton({
    Key? key,
    required this.onPressed,
    this.color = AppColors.roxo,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color color;

  @override
  _RippleAnimationButtonState createState() => _RippleAnimationButtonState();
}

class _RippleAnimationButtonState extends State<RippleAnimationButton>
    with TickerProviderStateMixin {
  List<String> records = [];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: CirclePainter(
          _controller,
          color: widget.color,
        ),
        child: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: TextButton(
              onPressed: () {
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
          ),
        ),
      ),
    );
  }
}
