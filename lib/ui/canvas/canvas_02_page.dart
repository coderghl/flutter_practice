import 'package:flutter/material.dart';
import 'package:flutter_practice/utils/device_orientation_util.dart';

class Canvas02Page extends StatefulWidget {
  const Canvas02Page({super.key});

  @override
  State<Canvas02Page> createState() => _Canvas02PageState();
}

class _Canvas02PageState extends State<Canvas02Page> {
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
    final Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 5;

    canvas.drawLine(const Offset(0, 0), const Offset(100, 100), paint);

    Path path = Path();
    path
      ..moveTo(100, 100)
      ..lineTo(200, 0);

    canvas.drawPath(path, paint..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
