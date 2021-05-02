import 'package:flutter/widgets.dart';
import 'package:timer_controller/src/timer_controller.dart';
import 'package:timer_controller/src/timer_controller_listener.dart';
import 'package:timer_controller/src/timer_value.dart';

/// Signature for the `builder` function which takes the `BuildContext` and
/// [value] and is responsible for returning a widget which is to be rendered.
/// This is analogous to the `builder` function in [StreamBuilder].
typedef TimerControllerWidgetBuilder = Widget Function(
  BuildContext context,
  TimerValue value,
  Widget child,
);

/// Signature for the `buildWhen` function which takes the previous `value` and
/// the current `value` and is responsible for returning a [bool] which
/// determines whether to rebuild [TimerControllerBuilder] with the current `value`.
typedef TimerControllerBuilderCondition = bool Function(
  TimerValue previous,
  TimerValue current,
);

/// {@template timer_controller_builder}
/// [TimerControllerBuilder] handles building a widget in response to new `value`.
/// Please refer to `TimerControllerListener` if you want to "do" anything in response to
/// `value` changes such as navigation, showing a dialog, etc...
///
/// ```dart
/// TimerControllerBuilder(
///   controller: myTimerController,
///   builder: (context, value, child) {
///   // return widget here based on myTimerController
///   }
/// )
/// ```
/// {@endtemplate}
///
/// {@template timer_controller_builder_build_when}
/// An optional [buildWhen] can be implemented for more granular control over
/// how often [TimerControllerBuilder] rebuilds.
/// [buildWhen] will be invoked on each [controller] `value` change.
/// [buildWhen] takes the previous and current `value` and must
/// return a [bool] which determines whether or not the [builder] function will
/// be invoked.
/// The previous `value` will be initialized to the `value` of the [controller] when
/// the [TimerControllerBuilder] is initialized.
/// [buildWhen] is optional and if omitted, it will default to `true`.
///
/// ```dart
/// TimerControllerBuilder(
///   controller: myTimerController,
///   buildWhen: (previous, current) {
///     // return true/false to determine whether or not
///     // to rebuild the widget with state
///   },
///   builder: (context, value, child) {
///     // return widget here based on myTimerController value
///   }
///)
/// ```
/// {@endtemplate}
class TimerControllerBuilder extends StatefulWidget {
//   /// {@macro timer_controller_builder}
  const TimerControllerBuilder({
    @required this.builder,
    @required this.controller,
    this.buildWhen,
    this.child,
    Key key,
  })  : assert(builder != null),
        assert(controller != null),
        super(key: key);

  /// The [builder] function which will be invoked on each widget build.
  /// The [builder] takes the `BuildContext` the current `value` and a `child` and
  /// must return a widget.
  final TimerControllerWidgetBuilder builder;

  /// The [TimerController] that will be listened.
  final TimerController controller;

  /// {@macro timer_controller_builder_build_when}
  final TimerControllerBuilderCondition buildWhen;

  /// The widget below in the tree.
  ///
  /// For an explanation on the `child` parameter that `builder` receives,
  /// see the "Performance optimizations" section of [AnimatedBuilder].
  final Widget child;

  @override
  _TimerControllerBuilder createState() => _TimerControllerBuilder();
}

class _TimerControllerBuilder extends State<TimerControllerBuilder> {
  TimerValue _value;

  @override
  void initState() {
    super.initState();
    _value = widget.controller.value;
  }

  @override
  void didUpdateWidget(TimerControllerBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller.value != widget.controller.value) {
      _value = widget.controller.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TimerControllerListener(
      controller: widget.controller,
      listenWhen: widget.buildWhen,
      listener: (context, value) => setState(
        () => _value = value,
      ),
      child: widget.builder(
        context,
        _value,
        widget.child,
      ),
    );
  }
}
