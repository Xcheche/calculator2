import 'package:flutter/material.dart';
import 'dart:async';

import 'calculator_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToCalculatorScreen();
  }

  _navigateToCalculatorScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CalculatorScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Simple Calculator',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
