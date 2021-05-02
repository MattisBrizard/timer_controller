import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timer_controller/timer_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer controller demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _TimerWidget(),
    );
  }
}

class _TimerWidget extends StatefulWidget {
  const _TimerWidget({
    Key key,
  }) : super(key: key);

  @override
  __TimerWidgetState createState() => __TimerWidgetState();
}

class __TimerWidgetState extends State<_TimerWidget> {
  TimerController _controller;

  @override
  void initState() {
    _controller = TimerController.seconds(20);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer controller demo'),
      ),
      body: TimerControllerListener(
        controller: _controller,
        listenWhen: (previousValue, currentValue) =>
            previousValue.status != currentValue.status,
        listener: (context, timerValue) {
          ScaffoldMessenger.of(context).showSnackBar(
            _StatusSnackBar(
              'Status: ${describeEnum(timerValue.status)}',
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TimerControllerBuilder(
                controller: _controller,
                builder: (context, timerValue, _) {
                  Color timerColor = Colors.black;
                  switch (timerValue.status) {
                    case TimerStatus.initial:
                      timerColor = Colors.black;
                      break;
                    case TimerStatus.running:
                      timerColor = Colors.green;
                      break;
                    case TimerStatus.paused:
                      timerColor = Colors.grey;
                      break;
                    case TimerStatus.finished:
                      timerColor = Colors.red;
                      break;
                  }
                  return Text(
                    '${timerValue.remaining}',
                    style: TextStyle(
                      fontSize: 50,
                      color: timerColor,
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _ActionButton(
                    title: 'Start',
                    onPressed: () => _controller.start(),
                  ),
                  _ActionButton(
                    title: 'Pause',
                    onPressed: () => _controller.pause(),
                  ),
                  _ActionButton(
                    title: 'Reset',
                    onPressed: () => _controller.reset(),
                  ),
                  _ActionButton(
                    title: 'Restart',
                    onPressed: () => _controller.restart(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    Key key,
    this.onPressed,
    @required this.title,
  })  : assert(title != null),
        super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

class _StatusSnackBar extends SnackBar {
  _StatusSnackBar(
    String title,
  )   : assert(title != null),
        super(
          content: Text(
            title,
          ),
          duration: const Duration(seconds: 1),
        );
}
