import 'package:flutter/material.dart';
import 'package:flutter_practice/utils/device_orientation_util.dart';

class Canvas01Page extends StatefulWidget {
  const Canvas01Page({super.key});

  @override
  State<Canvas01Page> createState() => _Canvas01PageState();
}

class _Canvas01PageState extends State<Canvas01Page> {
  @override
  void initState() {
    setDeviceHorizontal();
    super.initState();
  }

  @override
  void dispose() {
    setDeviceVertical();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: CustomPaint(
        painter: _PaperPainter(),
      ),
    );
  }
}

class _PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // create paint
    final Paint paint = Paint();

    // draw circle
    canvas.drawCircle(const Offset(100, 100), 10, paint);

    // set paint arguments
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 5;

    // draw line
    canvas.drawLine(
      const Offset(0, 0),
      const Offset(100, 100),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
