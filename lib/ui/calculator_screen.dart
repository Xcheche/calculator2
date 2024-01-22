import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //calculator logic
  late int firstNumber;
  late int secondNumber;
  String textToDisplay = "";
  late String operationToPerform;
  late String result;

  void buttonClicked(String btnText) {
    if (btnText == "c") {
      textToDisplay = "";
      firstNumber = 0;
      secondNumber = 0;
      result = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "/" ||
        btnText == "x") {
      firstNumber = int.parse(textToDisplay);
      result = "";
      operationToPerform = btnText;
    } else if (btnText == "=") {
      secondNumber = int.parse(textToDisplay);
      if (operationToPerform == "+") {
        result = (firstNumber + secondNumber).toString();
      } else if (operationToPerform == "-") {
        result = (firstNumber - secondNumber).toString();
      } else if (operationToPerform == "x") {
        result = (firstNumber * secondNumber).toString();
      } else if (operationToPerform == "/") {
        result = (secondNumber != 0)
            ? (firstNumber / secondNumber).toString()
            : "Error";
      }
    } else {
      result = (int.parse(textToDisplay + btnText)).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  Widget customButton(String buttonValue) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonClicked(buttonValue),
        child: Text(
          // ignore: unnecessary_string_interpolations
          "$buttonValue",
          style: const TextStyle(fontSize: 25.0, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 10.0,
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    // ignore: unnecessary_string_interpolations
                    '$textToDisplay',
                    style: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customButton('9'),
                customButton('8'),
                customButton('7'),
                customButton('+'),
              ],
            ),
            Row(
              children: [
                customButton('6'),
                customButton('5'),
                customButton('4'),
                customButton('-'),
              ],
            ),
            Row(
              children: [
                customButton('3'),
                customButton('2'),
                customButton('1'),
                customButton('x'),
              ],
            ),
            Row(
              children: [
                customButton('c'),
                customButton('0'),
                customButton('='),
                customButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
