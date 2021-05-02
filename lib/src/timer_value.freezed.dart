// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timer_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimerValueTearOff {
  const _$TimerValueTearOff();

  _TimerValue call(
      {required int remaining,
      required TimerUnit unit,
      TimerStatus status = TimerStatus.initial}) {
    return _TimerValue(
      remaining: remaining,
      unit: unit,
      status: status,
    );
  }
}

/// @nodoc
const $TimerValue = _$TimerValueTearOff();

/// @nodoc
mixin _$TimerValue {
  /// The amount of `unit` that remains.
  int get remaining => throw _privateConstructorUsedError;

  /// The unit of the timer.
  TimerUnit get unit => throw _privateConstructorUsedError;

  /// The status of the timer.
  TimerStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerValueCopyWith<TimerValue> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? remaining = freezed,
    Object? unit = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      remaining: remaining == freezed
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as TimerUnit,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
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
    Object? remaining = freezed,
    Object? unit = freezed,
    Object? status = freezed,
  }) {
    return _then(_TimerValue(
      remaining: remaining == freezed
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as TimerUnit,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
    ));
  }
}

/// @nodoc

class _$_TimerValue with DiagnosticableTreeMixin implements _TimerValue {
  const _$_TimerValue(
      {required this.remaining,
      required this.unit,
      this.status = TimerStatus.initial})
      : assert(remaining >= 0, 'remaining should be greater than 0');

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

  @JsonKey(ignore: true)
  @override
  _$TimerValueCopyWith<_TimerValue> get copyWith =>
      __$TimerValueCopyWithImpl<_TimerValue>(this, _$identity);
}

abstract class _TimerValue implements TimerValue {
  const factory _TimerValue(
      {required int remaining,
      required TimerUnit unit,
      TimerStatus status}) = _$_TimerValue;

  @override

  /// The amount of `unit` that remains.
  int get remaining => throw _privateConstructorUsedError;
  @override

  /// The unit of the timer.
  TimerUnit get unit => throw _privateConstructorUsedError;
  @override

  /// The status of the timer.
  TimerStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimerValueCopyWith<_TimerValue> get copyWith =>
      throw _privateConstructorUsedError;
}
