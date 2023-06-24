import 'package:flutter/material.dart';

import 'screens/home/ui/home.dart';

void main(List<String> args) {
  runApp(BlocTestApp());
}

class BlocTestApp extends StatelessWidget {
  const BlocTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      home: Home(),
    );
  }
}
