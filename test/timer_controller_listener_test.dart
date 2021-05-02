import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timer_controller/timer_controller.dart';

void main() {
  TimerController timerController;

  setUp(() {
    timerController = TimerController.seconds(1);
  });

  tearDown(() {
    timerController.dispose();
  });

  testWidgets(
    'should fire listener callback when timer updates',
    (tester) async {
      int count = 0;

      await tester.pumpWidget(
        TimerControllerListener(
          controller: timerController,
          listener: (context, value) {
            count++;
          },
          child: const SizedBox(),
        ),
      );

      expect(count, 0);

      timerController.start();

      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(count, 2);
    },
  );

  testWidgets(
    'should not fire listener callback when timer updates and listenWhen is set to false',
    (tester) async {
      int count = 0;

      await tester.pumpWidget(
        TimerControllerListener(
          controller: timerController,
          listenWhen: (previous, current) => false,
          listener: (context, value) {
            count++;
          },
          child: const SizedBox(),
        ),
      );

      expect(count, 0);

      timerController.start();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(count, 0);
    },
  );
}
