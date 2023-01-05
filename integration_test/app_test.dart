import 'package:flutter_test/flutter_test.dart';

import 'package:calc/main.dart' as app;

import 'robots/home_robot.dart';

void main() {
  HomeRobot homeRobot;

  group('calculator test', () {
    testWidgets('whole app', (WidgetTester tester) async {
      app.main();
      homeRobot = HomeRobot(tester);
      await homeRobot.findKeys();
      await homeRobot.findUserInputDisplay();
      await homeRobot.addOperation();
      await homeRobot.minusOperation();
      await homeRobot.multiplication();
      await homeRobot.divison();
      await homeRobot.addDecimalOperation();
      await homeRobot.minusDecimalOperation();
      await homeRobot.decimalMultiplication();
      await homeRobot.decimalDivison();
    });
  });
}
