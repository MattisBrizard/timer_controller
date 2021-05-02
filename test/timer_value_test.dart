import 'package:flutter_test/flutter_test.dart';
import 'package:timer_controller/timer_controller.dart';

void main() {
  test(
    'TimerValue constructor should throw assertion when remaining is negative',
    () {
      expect(
        () => TimerValue(
          remaining: -1,
          unit: TimerUnit.second,
        ),
        throwsAssertionError,
      );
    },
  );
}
