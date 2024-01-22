import 'package:flutter/material.dart';

import 'ui/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      color: Colors.indigo,

      // theme: ThemeData(primarySwatch: Colors.grey),

      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const CalculatorScreen(),
    );
  }
}
