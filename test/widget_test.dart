import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calc/main.dart';

void main() {
  testWidgets('Buttons availble or not', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

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
  });

  testWidgets('UserInput', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byKey(const Key("1")));
    await tester.pump();

    expect(find.byKey(const Key("userInput")), findsOneWidget);
    var values = find.byKey(const Key("userInput"));
    var text = values.evaluate().single.widget as Text;
    expect(text.data, "1");
  });

  testWidgets('Add operation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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
  });

  testWidgets('Min operation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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
  });

  testWidgets('Multi operation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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
  });

  testWidgets('Div operation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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
  });

//Decimal operation

  testWidgets('Add operation decimal', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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
  });

  testWidgets('Min operation decimal', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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
  });

  testWidgets('Multi operation decimal', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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
  });

  testWidgets('Div operation decimal', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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
  });
}
