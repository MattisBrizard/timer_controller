import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_controller/src/timer_value.dart';

/// A timer controller.
///
/// Whenever the controller updates his timer [value] it notifies its listeners.
/// Listeners can then read the [value] and run actions
/// or draw specific widgets.
///
/// Remember to [dispose] of the [TimerController] when it is no longer needed.
///
/// See also:
///
///  * [TimerControllerBuilder], which is a widget that listen a [TimerController] and build a widget depending on the [value].
///  * [TimerControllerListener], which is a widget that listen a [TimerController] and run callback depending on the [value].
class TimerController extends ValueNotifier<TimerValue> {
  /// Creates a timer controller with `TimerUnit.second` as unit.
  factory TimerController.seconds(int remaining) => TimerController._(
        value: TimerValue(
          remaining: remaining,
          unit: TimerUnit.second,
        ),
        shouldDowngradeUnit: true,
      );

  /// Creates a timer controller with `TimerUnit.minute` as unit.
  ///
  /// `shouldDowngradeUnit` determines if the timer should use seconds as unit
  /// when only 1 minute left.
  factory TimerController.minutes(
    int remaining, {
    bool shouldDowngradeUnit = true,
  }) =>
      TimerController._(
        value: TimerValue(
          remaining: remaining,
          unit: TimerUnit.minute,
        ),
        shouldDowngradeUnit: shouldDowngradeUnit,
      );

  /// Creates a timer controller with `TimerUnit.hour` as unit.
  ///
  /// `shouldDowngradeUnit` determines if the timer should use minutes and then seconds as unit
  /// when only 1 hour and then 1 minute left.
  factory TimerController.hours(
    int remaining, {
    bool shouldDowngradeUnit = true,
  }) =>
      TimerController._(
        value: TimerValue(
          remaining: remaining,
          unit: TimerUnit.hour,
        ),
        shouldDowngradeUnit: shouldDowngradeUnit,
      );

  TimerController._({
    required TimerValue value,
    required this.shouldDowngradeUnit,
  })   : assert(value.remaining > 0, 'value.remaining must be greater than 0'),
        initialValue = value,
        super(value);

  static const _oneHourInMinutes = 60;
  static const _oneMinuteInSeconds = 60;

  final TimerValue initialValue;
  final bool shouldDowngradeUnit;

  TimerUnit get _unit => value.unit;
  TimerStatus get _status => value.status;
  bool get _hasFinished => _status == TimerStatus.finished;

  Timer? _timer;
  late DateTime _nextRefresh;
  Duration? _durationToNextRefresh;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Start the timer.
  void start() {
    if (_status != TimerStatus.running && !_hasFinished) {
      value = value.copyWith(status: TimerStatus.running);
      _updateTimer();
    }
  }

  /// Pause the timer.
  void pause() {
    if (_status == TimerStatus.running) {
      value = value.copyWith(status: TimerStatus.paused);
      _durationToNextRefresh = _nextRefresh.difference(DateTime.now());
      _timer?.cancel();
    }
  }

  /// Reset the timer to the initial value.
  ///
  /// The timer status will be initial, to start it again use `start()`
  /// or see `restart()` method.
  void reset() {
    _timer?.cancel();
    value = initialValue;
    _durationToNextRefresh = null;
  }

  /// Reset the timer to the initial value and start it again.
  void restart() {
    _timer?.cancel();
    _durationToNextRefresh = null;
    value = initialValue.copyWith(status: TimerStatus.running);
    _updateTimer();
  }

  void _updateRemaining() {
    final newValue = value.remaining - 1;
    if (newValue == 1) {
      if (shouldDowngradeUnit) {
        switch (_unit) {
          case TimerUnit.hour:
            value = value.copyWith(
              remaining: _oneHourInMinutes,
              unit: TimerUnit.minute,
            );
            break;
          case TimerUnit.minute:
            value = value.copyWith(
              remaining: _oneMinuteInSeconds,
              unit: TimerUnit.second,
            );
            break;
          case TimerUnit.second:
            value = value.copyWith(remaining: newValue);
            break;
          default:
        }
      }
    } else if (newValue == 0) {
      value = value.copyWith(
        remaining: newValue,
        status: TimerStatus.finished,
      );
    } else {
      value = value.copyWith(remaining: newValue);
    }
    _updateTimer();
  }

  void _updateTimer() {
    Duration? tickDuration;
    switch (_unit) {
      case TimerUnit.hour:
        tickDuration = const Duration(hours: 1);
        break;
      case TimerUnit.minute:
        tickDuration = const Duration(minutes: 1);
        break;
      case TimerUnit.second:
        if (!_hasFinished) {
          tickDuration = const Duration(seconds: 1);
        }
        break;
      default:
        _timer?.cancel();
    }
    if (tickDuration != null) {
      final effectiveDuration = _durationToNextRefresh ?? tickDuration;
      _timer = Timer(effectiveDuration, _updateRemaining);
      _nextRefresh = DateTime.now().add(effectiveDuration);
      _durationToNextRefresh = null;
    }
  }
}
