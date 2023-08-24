import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_practice/utils/device_orientation_util.dart';

class Canvas03Page extends StatefulWidget {
  const Canvas03Page({super.key});

  @override
  State<Canvas03Page> createState() => _Canvas03PageState();
}

class _Canvas03PageState extends State<Canvas03Page> {
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
  final Paint _paint = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.blue;

  final Paint _gridPaint = Paint();
  final double _step = 20;
  final double strokeWidth = .5;
  final Color _color = Colors.grey;

  @override
  void paint(Canvas canvas, Size size) {
    _canvasTranslateToCenter(canvas, size);

    _gridPaint
      ..style = PaintingStyle.stroke
      ..color = _color
      ..strokeWidth = strokeWidth;

    canvas.save();
    canvas.scale(1, -1);
    _drawGrid(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1);
    _drawGrid(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, 1);
    _drawGrid(canvas, size);
    canvas.restore();

    _drawGrid(canvas, size);

    _drawAxis(canvas, size);

    canvas.save();
    canvas.translate(-size.width / 2 + 50 + 65, -size.height / 2 + 50 + 65);
    _drawSun(canvas, size);
    canvas.restore();

    _drawPoints(canvas, size);
  }

  // draw Axis
  void _drawAxis(Canvas canvas, Size size) {
    _paint
      ..color = Colors.blue
      ..strokeWidth = 2;

    canvas.drawLine(
        Offset(0, -size.height / 2), Offset(0, size.height / 2), _paint);
    canvas.drawLine(
        Offset(-size.width / 2, 0), Offset(size.width / 2, 0), _paint);
    canvas.drawLine(
        Offset(size.width / 2 - 20, -20), Offset(size.width / 2, 0), _paint);
    canvas.drawLine(
        Offset(size.width / 2 - 20, 20), Offset(size.width / 2, 0), _paint);

    canvas.drawLine(
        Offset(-20, size.height / 2 - 10), Offset(0, size.height / 2), _paint);

    canvas.drawLine(
        Offset(20, size.height / 2 - 10), Offset(0, size.height / 2), _paint);
  }

  // draw points
  void _drawPoints(Canvas canvas, Size size) {
    const List<Offset> points = [
      Offset(-120, -20),
      Offset(-80, -80),
      Offset(-40, -40),
      Offset(0, -100),
      Offset(40, -140),
      Offset(80, -160),
      Offset(120, -100),
    ];

    canvas.drawPoints(PointMode.polygon, points, _paint..strokeWidth = 5);
    canvas.drawPoints(
        PointMode.points,
        points,
        _paint
          ..color = Colors.red
          ..strokeWidth = 10);
  }

  // draw sun
  void _drawSun(Canvas canvas, Size size) {
    const int ligntCount = 12;

    canvas.drawCircle(
        Offset.zero,
        50,
        _paint
          ..color = Colors.redAccent
          ..style = PaintingStyle.fill);

    _paint
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < ligntCount; i++) {
      double step = 2 * pi / ligntCount;
      canvas.drawLine(const Offset(65, 0), const Offset(80, 0), _paint);
      canvas.rotate(step);
    }
  }

  // draw grid
  void _drawGrid(Canvas canvas, Size size) {
    canvas.save();

    for (int i = 0; i < size.width / 2 / _step; i++) {
      canvas.drawLine(Offset.zero, Offset(0, size.height / 2), _gridPaint);
      canvas.translate(_step, 0);
    }

    canvas.restore();

    canvas.save();

    for (int i = 0; i < size.height / 2 / _step; i++) {
      canvas.drawLine(Offset.zero, Offset(size.width / 2, 0), _gridPaint);
      canvas.translate(0, _step);
    }

    canvas.restore();
  }

  // canvas tranlate to center
  void _canvasTranslateToCenter(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
