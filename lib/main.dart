import 'dart:math';
import 'package:flutter/material.dart';
import 'Views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CALC',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  MyHomePage createState() => MyHomePage();
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends State<Home> {
  var userInput = "0";
  var displayOutput = '';
  double temp = 0;

  double first = 0;
  double second = 0;
  double backlog = 0;
  var res = "";
  var text = "";
  var opp = "";
  var detail = "";
  var toggle = 0;

  num digit = 0;

  final List<String> buttons = [
    "7",
    "8",
    "9",
    "+",
    "4",
    "5",
    "6",
    "x",
    "1",
    "2",
    "3",
    "-",
    "C",
    "0",
    ".",
    "/",
  ];

  final List<String> lastLine = [
    "0",
    ".",
    "=",
  ];

  void reset() {
    res = "0";
    first = 0;
    second = 0;
    opp = "";
    temp = 0;
    detail = "";
    toggle = 0;
    digit = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('CALC'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              // ignore: prefer_const_constructors
              child: Text(
                displayOutput,
                key: const Key("displayOutput"),
                textAlign: TextAlign.right,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              // ignore: prefer_const_constructors
              child: Text(
                userInput,
                key: const Key("userInput"),
                textAlign: TextAlign.right,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        View(0, buttons, btnClicked),
                        View(1, buttons, btnClicked),
                        View(2, buttons, btnClicked),
                        View(3, buttons, btnClicked),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        View(4, buttons, btnClicked),
                        View(5, buttons, btnClicked),
                        View(6, buttons, btnClicked),
                        View(7, buttons, btnClicked)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        View(8, buttons, btnClicked),
                        View(9, buttons, btnClicked),
                        View(10, buttons, btnClicked),
                        View(11, buttons, btnClicked)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        View(12, buttons, btnClicked),
                        View(13, buttons, btnClicked),
                        View(14, buttons, btnClicked),
                        View(15, buttons, btnClicked)
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            key: const Key("="),
                            onPressed: () => btnClicked("="),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        side: BorderSide.none))),
                            child: const Text(
                              '=',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  void btnClicked(String btnText) {
    if (btnText == "C" ||
        btnText == "+/-" ||
        btnText == "%" ||
        btnText == "+" ||
        btnText == "x" ||
        btnText == "-" ||
        btnText == "/" ||
        btnText == "." ||
        btnText == "=") {
      if (btnText == "+" && res.toString() == "") {
        first = temp.toDouble();
        opp = btnText;
        temp = 0;
        toggle = 0;
        digit = 0;
      } else if (btnText == "+" && res.toString() != "") {
        first = double.parse(res);
        opp = btnText;
        temp = 0;
        toggle = 0;
        digit = 0;
      }
      if (btnText == "x" && res.toString() == "") {
        first = temp.toDouble();
        opp = btnText;
        temp = 0;
        toggle = 0;
        digit = 0;
      } else if (btnText == "x" && res.toString() != "") {
        first = double.parse(res);
        opp = btnText;
        temp = 0;
        toggle = 0;
        digit = 0;
      }
      if (btnText == "-" && res.toString() == "") {
        first = temp.toDouble();
        opp = btnText;
        temp = 0;
        toggle = 0;
        digit = 0;
      } else if (btnText == "-" && res.toString() != "") {
        first = double.parse(res);
        opp = btnText;
        temp = 0;
        toggle = 0;
        digit = 0;
      }
      if (btnText == "/" && res.toString() == "") {
        first = temp.toDouble();
        opp = btnText;
        temp = 0;
        toggle = 0;
        digit = 0;
      } else if (btnText == "/" && res.toString() != "") {
        first = double.parse(res);
        opp = btnText;
        temp = 0;
        toggle = 0;
        digit = 0;
      }
      if (btnText == "." && toggle == 0) {
        toggle = 1;
      }

      if (btnText == "=") {
        digit = 0;

        if ((opp == "+") && (toggle == 0)) {
          second = temp.toDouble();
          res = ((first + second).toInt()).toString();
          opp = "";
        }
        if ((opp == "+") && (toggle == 1)) {
          second = temp.toDouble();
          res = ((first + second)).toStringAsFixed(
              (first.toString().split('.')[1].length <
                      second.toString().split('.')[1].length
                  ? second.toString().split('.')[1].length
                  : first.toString().split('.')[1].length));
          opp = "";
        }
        if ((opp == "-") && (toggle == 0)) {
          second = temp.toDouble();
          res = ((first - second).toInt()).toString();
          opp = "";
        }
        if ((opp == "-") && (toggle == 1)) {
          second = temp.toDouble();
          res = ((first - second)).toStringAsFixed(
              (first.toString().split('.')[1].length <
                      second.toString().split('.')[1].length
                  ? second.toString().split('.')[1].length
                  : first.toString().split('.')[1].length));
          opp = "";
        }
        if ((opp == "x") && (toggle == 0)) {
          second = temp.toDouble();
          res = ((first * second).toInt()).toString();
          opp = "";
        }
        if ((opp == "x") && (toggle == 1)) {
          second = temp.toDouble();
          res = ((first * second)).toStringAsFixed(
              (first.toString().split('.')[1].length <
                      second.toString().split('.')[1].length
                  ? second.toString().split('.')[1].length
                  : first.toString().split('.')[1].length));
          opp = "";
        }
        if ((opp == "/") && (toggle == 0)) {
          second = temp.toDouble();
          res = ((first / second)).toStringAsFixed(
              (first.toString().split('.')[1].length <
                      second.toString().split('.')[1].length
                  ? second.toString().split('.')[1].length
                  : first.toString().split('.')[1].length));
          opp = "";
        }
        if ((opp == "/") && (toggle == 1)) {
          second = temp.toDouble();
          res = ((first / second)).toStringAsFixed(
              (first.toString().split('.')[1].length <
                      second.toString().split('.')[1].length
                  ? second.toString().split('.')[1].length
                  : first.toString().split('.')[1].length));
          opp = "";
        }
        toggle = 0;
      }
      if (btnText == "C") {
        reset();
        detail = "";
      }
    } else if (toggle == 0 && btnText != "=") {
      temp = (pow(10, 1).toInt() * temp) + int.parse(btnText);
      res = (temp.toInt()).toString();
    } else {
      digit = digit - 1;
      temp = (pow(10, digit) * int.parse(btnText)).toDouble() + temp;
      res = temp.toString();
    }

    if (btnText != "=") {
      if (btnText == "C") {
        detail = "";
      } else {
        detail = detail + btnText;
      }
    }

    displayOutput = detail;
    userInput = res;
    setState(() {});
  }
}
