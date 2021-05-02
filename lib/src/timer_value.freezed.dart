// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'timer_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TimerValueTearOff {
  const _$TimerValueTearOff();

// ignore: unused_element
  _TimerValue call(
      {@required int remaining,
      @required TimerUnit unit,
      TimerStatus status = TimerStatus.initial}) {
    return _TimerValue(
      remaining: remaining,
      unit: unit,
      status: status,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TimerValue = _$TimerValueTearOff();

/// @nodoc
mixin _$TimerValue {
  /// The amount of `unit` that remains.
  int get remaining;

  /// The unit of the timer.
  TimerUnit get unit;

  /// The status of the timer.
  TimerStatus get status;

  $TimerValueCopyWith<TimerValue> get copyWith;
}

/// @nodoc
abstract class $TimerValueCopyWith<$Res> {
  factory $TimerValueCopyWith(
          TimerValue value, $Res Function(TimerValue) then) =
      _$TimerValueCopyWithImpl<$Res>;
  $Res call({int remaining, TimerUnit unit, TimerStatus status});
}

/// @nodoc
class _$TimerValueCopyWithImpl<$Res> implements $TimerValueCopyWith<$Res> {
  _$TimerValueCopyWithImpl(this._value, this._then);

  final TimerValue _value;
  // ignore: unused_field
  final $Res Function(TimerValue) _then;

  @override
  $Res call({
    Object remaining = freezed,
    Object unit = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      remaining: remaining == freezed ? _value.remaining : remaining as int,
      unit: unit == freezed ? _value.unit : unit as TimerUnit,
      status: status == freezed ? _value.status : status as TimerStatus,
    ));
  }
}

/// @nodoc
abstract class _$TimerValueCopyWith<$Res> implements $TimerValueCopyWith<$Res> {
  factory _$TimerValueCopyWith(
          _TimerValue value, $Res Function(_TimerValue) then) =
      __$TimerValueCopyWithImpl<$Res>;
  @override
  $Res call({int remaining, TimerUnit unit, TimerStatus status});
}

/// @nodoc
class __$TimerValueCopyWithImpl<$Res> extends _$TimerValueCopyWithImpl<$Res>
    implements _$TimerValueCopyWith<$Res> {
  __$TimerValueCopyWithImpl(
      _TimerValue _value, $Res Function(_TimerValue) _then)
      : super(_value, (v) => _then(v as _TimerValue));

  @override
  _TimerValue get _value => super._value as _TimerValue;

  @override
  $Res call({
    Object remaining = freezed,
    Object unit = freezed,
    Object status = freezed,
  }) {
    return _then(_TimerValue(
      remaining: remaining == freezed ? _value.remaining : remaining as int,
      unit: unit == freezed ? _value.unit : unit as TimerUnit,
      status: status == freezed ? _value.status : status as TimerStatus,
    ));
  }
}

/// @nodoc
class _$_TimerValue with DiagnosticableTreeMixin implements _TimerValue {
  const _$_TimerValue(
      {@required this.remaining,
      @required this.unit,
      this.status = TimerStatus.initial})
      : assert(remaining != null),
        assert(unit != null),
        assert(status != null),
        assert(remaining >= 0, 'remaining should be greater than 0');

  @override

  /// The amount of `unit` that remains.
  final int remaining;
  @override

  /// The unit of the timer.
  final TimerUnit unit;
  @JsonKey(defaultValue: TimerStatus.initial)
  @override

  /// The status of the timer.
  final TimerStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerValue(remaining: $remaining, unit: $unit, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerValue'))
      ..add(DiagnosticsProperty('remaining', remaining))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimerValue &&
            (identical(other.remaining, remaining) ||
                const DeepCollectionEquality()
                    .equals(other.remaining, remaining)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(remaining) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(status);

  @override
  _$TimerValueCopyWith<_TimerValue> get copyWith =>
      __$TimerValueCopyWithImpl<_TimerValue>(this, _$identity);
}

abstract class _TimerValue implements TimerValue {
  const factory _TimerValue(
      {@required int remaining,
      @required TimerUnit unit,
      TimerStatus status}) = _$_TimerValue;

  @override

  /// The amount of `unit` that remains.
  int get remaining;
  @override

  /// The unit of the timer.
  TimerUnit get unit;
  @override

  /// The status of the timer.
  TimerStatus get status;
  @override
  _$TimerValueCopyWith<_TimerValue> get copyWith;
}
