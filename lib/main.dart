import 'package:flutter/material.dart';
import 'package:flutter_practice/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
