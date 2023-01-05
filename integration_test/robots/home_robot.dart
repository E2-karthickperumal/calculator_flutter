import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeRobot {
  const HomeRobot(this.tester);

  final WidgetTester tester;

  Future<void> findKeys() async {
    await tester.pumpAndSettle();

    expect(find.byKey(const Key("0")), findsOneWidget);
    expect(find.byKey(const Key("1")), findsOneWidget);
    expect(find.byKey(const Key("2")), findsOneWidget);
    expect(find.byKey(const Key("3")), findsOneWidget);
    expect(find.byKey(const Key("4")), findsOneWidget);
    expect(find.byKey(const Key("5")), findsOneWidget);
    expect(find.byKey(const Key("6")), findsOneWidget);
    expect(find.byKey(const Key("7")), findsOneWidget);
    expect(find.byKey(const Key("8")), findsOneWidget);
    expect(find.byKey(const Key("9")), findsOneWidget);
    expect(find.byKey(const Key("+")), findsOneWidget);
    expect(find.byKey(const Key("-")), findsOneWidget);
    expect(find.byKey(const Key("x")), findsOneWidget);
    expect(find.byKey(const Key("/")), findsOneWidget);
    expect(find.byKey(const Key("=")), findsOneWidget);
    expect(find.byKey(const Key("C")), findsOneWidget);
  }

  Future<void> findUserInputDisplay() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("1")));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    var values = find.byKey(const Key("userInput"));
    var text = values.evaluate().single.widget as Text;
    expect(text.data, "1");
  }

  Future<void> addOperation() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("C")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("0")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("+")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("=")));

    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    expect(find.byKey(const Key("displayOutput")), findsOneWidget);

    var inputValue =
        find.byKey(const Key("userInput")).evaluate().single.widget as Text;
    var outputValue =
        find.byKey(const Key("displayOutput")).evaluate().single.widget as Text;

    expect(inputValue.data, "103");
    expect(outputValue.data, "102+1");
  }

  Future<void> minusOperation() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("C")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("0")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("-")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("=")));

    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    expect(find.byKey(const Key("displayOutput")), findsOneWidget);

    var inputValue =
        find.byKey(const Key("userInput")).evaluate().single.widget as Text;
    var outputValue =
        find.byKey(const Key("displayOutput")).evaluate().single.widget as Text;

    expect(inputValue.data, "101");
    expect(outputValue.data, "102-1");
  }

  Future<void> multiplication() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("C")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("0")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("x")));
    await tester.tap(find.byKey(const Key("9")));
    await tester.tap(find.byKey(const Key("=")));

    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    expect(find.byKey(const Key("displayOutput")), findsOneWidget);

    var inputValue =
        find.byKey(const Key("userInput")).evaluate().single.widget as Text;
    var outputValue =
        find.byKey(const Key("displayOutput")).evaluate().single.widget as Text;

    expect(inputValue.data, "918");
    expect(outputValue.data, "102x9");
  }

  Future<void> divison() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("C")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("0")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("/")));
    await tester.tap(find.byKey(const Key("7")));
    await tester.tap(find.byKey(const Key("=")));

    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    expect(find.byKey(const Key("displayOutput")), findsOneWidget);

    var inputValue =
        find.byKey(const Key("userInput")).evaluate().single.widget as Text;
    var outputValue =
        find.byKey(const Key("displayOutput")).evaluate().single.widget as Text;

    expect(inputValue.data, "14.6");
    expect(outputValue.data, "102/7");
  }

  Future<void> addDecimalOperation() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("C")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("0")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key(".")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("+")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key(".")));
    await tester.tap(find.byKey(const Key("3")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("=")));

    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    expect(find.byKey(const Key("displayOutput")), findsOneWidget);

    var inputValue =
        find.byKey(const Key("userInput")).evaluate().single.widget as Text;
    var outputValue =
        find.byKey(const Key("displayOutput")).evaluate().single.widget as Text;

    expect(inputValue.data, "103.52");
    expect(outputValue.data, "102.2+1.32");
  }

  Future<void> minusDecimalOperation() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("C")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("0")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key(".")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("-")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key(".")));
    await tester.tap(find.byKey(const Key("3")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("=")));

    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    expect(find.byKey(const Key("displayOutput")), findsOneWidget);

    var inputValue =
        find.byKey(const Key("userInput")).evaluate().single.widget as Text;
    var outputValue =
        find.byKey(const Key("displayOutput")).evaluate().single.widget as Text;

    expect(inputValue.data, "100.88");
    expect(outputValue.data, "102.2-1.32");
  }

  Future<void> decimalMultiplication() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("C")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("0")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key(".")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("x")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key(".")));
    await tester.tap(find.byKey(const Key("3")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("=")));

    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    expect(find.byKey(const Key("displayOutput")), findsOneWidget);

    var inputValue =
        find.byKey(const Key("userInput")).evaluate().single.widget as Text;
    var outputValue =
        find.byKey(const Key("displayOutput")).evaluate().single.widget as Text;

    expect(inputValue.data, "134.90");
    expect(outputValue.data, "102.2x1.32");
  }

  Future<void> decimalDivison() async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("C")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key("0")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key(".")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("/")));
    await tester.tap(find.byKey(const Key("1")));
    await tester.tap(find.byKey(const Key(".")));
    await tester.tap(find.byKey(const Key("3")));
    await tester.tap(find.byKey(const Key("2")));
    await tester.tap(find.byKey(const Key("=")));

    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    expect(find.byKey(const Key("displayOutput")), findsOneWidget);

    var inputValue =
        find.byKey(const Key("userInput")).evaluate().single.widget as Text;
    var outputValue =
        find.byKey(const Key("displayOutput")).evaluate().single.widget as Text;

    expect(inputValue.data, "77.42");
    expect(outputValue.data, "102.2/1.32");
  }
}
