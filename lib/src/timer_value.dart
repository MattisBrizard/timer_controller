import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'timer_value.freezed.dart';

@freezed
abstract class TimerValue with _$TimerValue {
  @Assert('remaining >= 0', 'remaining should be greater than 0')
  const factory TimerValue({
    /// The amount of `unit` that remains.
    required int remaining,

    /// The unit of the timer.
    required TimerUnit unit,

    /// The status of the timer.
    @Default(TimerStatus.initial) TimerStatus status,
  }) = _TimerValue;
}

/// Describes the available timer units.
enum TimerUnit {
  hour,
  minute,
  second,
}

/// Describes the available timer status.
enum TimerStatus {
  initial,
  running,
  paused,
  finished,
}
