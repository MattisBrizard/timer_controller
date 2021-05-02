import 'package:flutter/widgets.dart';
import 'package:timer_controller/src/timer_controller.dart';
import 'package:timer_controller/src/timer_value.dart';

/// Signature for the `listener` function which takes the `BuildContext` along
/// with the `value` and is responsible for executing in response to
/// `value` changes.
typedef TimerControllerWidgetListener = void Function(
  BuildContext context,
  TimerValue value,
);

/// Signature for the `listenWhen` function which takes the previous `value`
/// and the current `value` and is responsible for returning a [bool] which
/// determines whether or not to call [TimerControllerWidgetListener] of [TimerControllerListener]
/// with the current `value`.
typedef TimerControllerListenerCondition = bool Function(
  TimerValue previous,
  TimerValue current,
);

/// {@template timer_controller_listener}
/// Takes a [TimerControllerWidgetListener] and a [TimerController] and invokes
/// the [listener] in response to `value` changes in the [controller].
/// It should be used for functionality that needs to occur only in response to
/// a `value` change such as navigation, showing a `SnackBar`, showing
/// a `Dialog`, etc...
/// The [listener] is guaranteed to only be called once for each `state` change
/// unlike the `builder` in `TimerController`.
///
/// ```dart
/// TimerControllerListener(
///   controller: myTimerController,
///   listener: (context, value) {
///     // do stuff here based on myTimerController value
///   },
///   child: Container(),
/// )
/// ```
/// {@endtemplate}
///
/// {@template timer_controller_listener_listen_when}
/// An optional [listenWhen] can be implemented for more granular control
/// over when [listener] is called.
/// [listenWhen] will be invoked on each [controller] `value` change.
/// [listenWhen] takes the previous and current `value` and must
/// return a [bool] which determines whether or not the [listener] function
/// will be invoked.
/// The previous `value` will be initialized to the `value` of the [controller]
/// when the [TimerControllerListener] is initialized.
/// [listenWhen] is optional and default to `true`.
///
/// ```dart
/// TimerControllerListener(
///   controller: myTimerController,
///   listenWhen: (previous, current) {
///     // return true/false to determine whether or not
///     // to invoke listener with value
///   },
///   listener: (context, value) {
///     // do stuff here based on myTimerController value
///   }
///   child: Container(),
/// )
/// ```
/// {@endtemplate}
class TimerControllerListener extends StatefulWidget {
  /// {@macro timer_controller_listener}
  const TimerControllerListener({
    Key? key,
    required this.controller,
    required this.listener,
    required this.child,
    this.listenWhen,
  }) : super(key: key);

  /// The [controller] whose `value` will be listened to.
  /// Whenever the [controller]'s `value` changes, [listener] will be invoked.
  final TimerController controller;

  /// The [TimerControllerWidgetListener] which will be called on every `value` change.
  /// This [listener] should be used for any code which needs to execute
  /// in response to a `value` change.
  final TimerControllerWidgetListener listener;

  /// {@macro timer_listener_listen_when}
  final TimerControllerListenerCondition? listenWhen;

  /// The widget below in the tree.
  final Widget child;

  @override
  _TimerControllerListenerState createState() =>
      _TimerControllerListenerState();
}

class _TimerControllerListenerState extends State<TimerControllerListener> {
  late TimerValue _previousValue;

  @override
  void initState() {
    super.initState();
    _previousValue = widget.controller.value;
    widget.controller.addListener(_listener);
  }

  @override
  void didUpdateWidget(TimerControllerListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller ||
        oldWidget.listener != widget.listener ||
        oldWidget.listenWhen != widget.listenWhen) {
      oldWidget.controller.removeListener(_listener);
      widget.controller.addListener(_listener);
      _previousValue = widget.controller.value;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;

  void _listener() {
    final TimerValue value = widget.controller.value;
    if (widget.listenWhen?.call(_previousValue, value) ?? true) {
      widget.listener(context, value);
    }
    _previousValue = value;
  }
}
