# timer_controller

A timer library that provides controls (play, pause, restart, etc) and widgets to consume the timer value.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  timer_controller: ^0.1.0
```

In your library add the following import:

```dart
import  'package:timer_controller/timer_controller.dart';
```

## TimerController

The `TimerController` extends `ValueNotifier`, so you can access his `value` which represents the information of the timer.

### Constructors

You can use different constructors depending on the available units :

```dart
final TimerController secondsTimer = TimerController.seconds(15);
final TimerController minutesTimer = TimerController.minutes(3);
final TimerController hoursTimer = TimerController.hours(2);
```

Note : Remember to dispose the `TimerController` when it is no longer needed.

### Controls

`start()`: Start the timer.

`pause()`: Pause the timer.

`reset()`: Reset the timer to the initial value.

`restart()`: Reset the timer to the initial value and start it again.

## TimerValue

The `TimerValue` represents the state of the timer and has some properties that you can use.

```dart
TimerValue({
    /// The amount of `unit` that remains.
  @required int remaining,

  /// The unit of the timer.
  @required TimerUnit unit,

  /// The status of the timer.
  @Default(TimerStatus.initial) TimerStatus status,
});
```

## Widgets

The `timer_controller` comes with built-in widgets to build widgets or to call actions depending on the controller.

### TimerControllerBuilder

To build a widget depending on the `value` of the `TimerController`, you can use the `TimerControllerBuilder` :

```dart
TimerControllerBuilder(
  controller: myTimerController,
  builder: (context, value, child) {
  // return widget here based on myTimerController
  }
 )
```

### TimerControllerListener

To run an action depending on the `value` of the `TimerController`, you can use the `TimerControllerBuilder` :

```dart
TimerControllerListener(
  controller: myTimerController,
  listener: (context, value) {
    // do stuff here based on myTimerController value
  },
  child: Container(),
)
```

## Examples

You can find an example of this package heres.

## Contribution

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/MattisBrizard/timer_controller/issues).
If you fixed a bug or implemented a feature, please send a pull [request](https://github.com/MattisBrizard/timer_controller/pulls).
