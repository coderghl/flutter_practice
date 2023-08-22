import 'package:flutter/material.dart';
import 'package:flutter_practice/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Practice'),
      ),
      body: ListView.separated(
        itemCount: routes.length,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        ),
        itemBuilder: (context, index) {
          final route = routes.entries.elementAt(index);
          return ListTile(
            title: Text(route.key),
            onTap: () => Navigator.pushNamed(context, route.key),
          );
        },
      ),
    );
  }
}
