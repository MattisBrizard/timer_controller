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
    'should rebuild widget when timer updates',
    (tester) async {
      int numBuilds = 0;
      const finishedKey = ValueKey('Finished');
      const runningKey = ValueKey('Running');

      await tester.pumpWidget(
        TimerControllerBuilder(
          controller: timerController,
          builder: (context, value, child) {
            numBuilds++;
            if (value.status == TimerStatus.finished) {
              return const SizedBox(
                key: finishedKey,
              );
            } else {
              return const SizedBox(
                key: runningKey,
              );
            }
          },
        ),
      );

      expect(numBuilds, 1);
      expect(find.byKey(finishedKey), findsNothing);
      expect(find.byKey(runningKey), findsOneWidget);

      timerController.start();

      // Rebuild because timer has started.
      await tester.pumpAndSettle();

      expect(numBuilds, 2);

      // Wait for time to be finished.
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byKey(finishedKey), findsOneWidget);
      expect(find.byKey(runningKey), findsNothing);
      expect(numBuilds, 3);
    },
  );

  testWidgets(
    'should not rebuild when timer updates and buildWhen set to false',
    (tester) async {
      int numBuilds = 0;
      const finishedKey = ValueKey('Finished');
      const runningKey = ValueKey('Running');

      await tester.pumpWidget(
        TimerControllerBuilder(
          controller: timerController,
          buildWhen: (previous, current) => false,
          builder: (context, value, child) {
            numBuilds++;
            if (value.status == TimerStatus.finished) {
              return const SizedBox(
                key: finishedKey,
              );
            } else {
              return const SizedBox(
                key: runningKey,
              );
            }
          },
        ),
      );

      expect(numBuilds, 1);
      expect(find.byKey(finishedKey), findsNothing);
      expect(find.byKey(runningKey), findsOneWidget);

      timerController.start();

      // Rebuild because timer has started.
      await tester.pumpAndSettle();

      expect(numBuilds, 1);

      // Wait for time to be finished.
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Widget not updated.
      expect(find.byKey(finishedKey), findsNothing);
      expect(find.byKey(runningKey), findsOneWidget);
      expect(numBuilds, 1);
    },
  );
}
