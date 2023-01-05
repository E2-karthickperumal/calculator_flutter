// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:calc/main.dart';

void main() {
  test('Add operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("+");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "3");
  });
  test('Min operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("-");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "1");
  });
  test('Multi operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("x");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "2");
  });
  test('Div operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("/");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "2");
  });
// Decimal Operations
  test('Add operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked("+");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "3.3");
  });
  test('Min operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked("-");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "0.9");
  });
  test('Multi operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked("x");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "2.5");
  });
  test('Div operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked("/");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "");
  });

//Decimal operation - 2
  test('Add operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("+");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "3.32");
  });

  test('Min operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("-");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "3.32");
  });

  test('Multi operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("x");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "3.32");
  });

  test('Div operation', () {
    final mainOperation = MyHomePage();
    mainOperation.btnClicked("2");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("/");
    mainOperation.btnClicked("1");
    mainOperation.btnClicked(".");
    mainOperation.btnClicked("2");
    mainOperation.btnClicked("=");
    expect(mainOperation.userInput, "3.32");
  });
}
