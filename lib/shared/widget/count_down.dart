import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  final Duration duration;

  const CountDown({
    required this.duration,
  });
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  // ignore: unused_field
  Timer? _timer;
  // ignore: unused_field
  Duration? _duration;

  @override
  void initState() {
    super.initState();
    _duration = widget.duration;
    startTimer();
  }

  startTimer() async {
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        if (_duration!.inMilliseconds == 0) {
          timer.cancel();
        } else {
          _duration = Duration(milliseconds: _duration!.inMilliseconds - 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${_duration!.inHours} : ${_duration!.inMinutes.remainder(60)} : ${_duration!.inSeconds.remainder(60)} : ${_duration!.inMilliseconds.remainder(1000)}',
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
