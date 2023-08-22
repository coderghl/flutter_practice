import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/canvas/canvas_01_page.dart';
import 'package:flutter_practice/ui/home_page.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomePage(),
  '/canvas/01': (context) => const Canvas01Page(),
};
