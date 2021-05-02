import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:timer_controller/src/timer_controller.dart';
import 'package:timer_controller/timer_controller.dart';

void main() {
  group(
    'Factory constructors',
    () {
      test(
        'TimerController.seconds should be second as unit',
        () {
          final controller = TimerController.seconds(1);
          expect(controller.value.unit, TimerUnit.second);
        },
      );

      test(
        'TimerController.minutes should be minute as unit',
        () {
          final controller = TimerController.minutes(1);
          expect(controller.value.unit, TimerUnit.minute);
        },
      );

      test(
        'TimerController.hours should be hour as unit',
        () {
          final controller = TimerController.hours(1);
          expect(controller.value.unit, TimerUnit.hour);
        },
      );

      test(
        'TimerController should throw assertionError when value is 0',
        () {
          expect(() => TimerController.seconds(0), throwsAssertionError);
        },
      );

      test(
        'TimerController should throw assertionError when value is negative',
        () {
          expect(() => TimerController.seconds(-42), throwsAssertionError);
        },
      );
    },
  );

  group(
    'TimerController status',
    () {
      late TimerController controller;
      setUp(() {
        controller = TimerController.seconds(1);
      });
      tearDown(() {
        controller.dispose();
      });

      test(
        'should be initial when created',
        () {
          expect(controller.value.status, TimerStatus.initial);
        },
      );

      test(
        'start() should set status to running',
        () {
          expect(controller.value.status, TimerStatus.initial);
          controller.start();
          expect(controller.value.status, TimerStatus.running);
        },
      );

      test(
        'shoud be finished when timer has finished',
        () async {
          expect(controller.value.status, TimerStatus.initial);
          final Completer completer = Completer<void>();

          controller.addListener(() {
            if (controller.value.remaining == 0) {
              completer.complete();
            }
          });

          controller.start();

          await completer.future;

          expect(controller.value.status, TimerStatus.finished);
        },
      );

      test(
        'pause() should set status to paused',
        () {
          expect(controller.value.status, TimerStatus.initial);
          controller.start();
          expect(controller.value.status, TimerStatus.running);
          controller.pause();
          expect(controller.value.status, TimerStatus.paused);
        },
      );

      test(
        'reset() should reset status to initial when timer is running',
        () {
          expect(controller.value.status, TimerStatus.initial);
          controller.start();
          expect(controller.value.status, TimerStatus.running);
          controller.reset();
          expect(controller.value.status, TimerStatus.initial);
        },
      );

      test(
        'reset() should reset status to initial when timer is paused',
        () {
          expect(controller.value.status, TimerStatus.initial);
          controller.start();
          expect(controller.value.status, TimerStatus.running);
          controller.pause();
          expect(controller.value.status, TimerStatus.paused);
          controller.reset();
          expect(controller.value.status, TimerStatus.initial);
        },
      );

      test(
        'reset() should reset status to initial when timer is finished',
        () async {
          expect(controller.value.status, TimerStatus.initial);
          final Completer completer = Completer<void>();
          controller.addListener(() {
            if (controller.value.remaining == 0) {
              completer.complete();
            }
          });
          controller.start();
          await completer.future;
          expect(controller.value.status, TimerStatus.finished);
          controller.reset();
          expect(controller.value.status, TimerStatus.initial);
        },
      );

      test(
        'restart() should let status to running when timer is running',
        () {
          expect(controller.value.status, TimerStatus.initial);
          controller.start();
          expect(controller.value.status, TimerStatus.running);
          controller.restart();
          expect(controller.value.status, TimerStatus.running);
        },
      );

      test(
        'restart() should set status to running when timer is paused',
        () {
          expect(controller.value.status, TimerStatus.initial);
          controller.start();
          expect(controller.value.status, TimerStatus.running);
          controller.pause();
          expect(controller.value.status, TimerStatus.paused);
          controller.restart();
          expect(controller.value.status, TimerStatus.running);
        },
      );

      test(
        'restart() should set status to running when timer is finished',
        () async {
          expect(controller.value.status, TimerStatus.initial);
          final Completer completer = Completer<void>();
          controller.addListener(() {
            if (controller.value.remaining == 0) {
              completer.complete();
            }
          });
          controller.start();
          await completer.future;
          expect(controller.value.status, TimerStatus.finished);
          controller.restart();
          expect(controller.value.status, TimerStatus.running);
        },
      );
    },
  );
}
