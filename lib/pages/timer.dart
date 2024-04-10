import 'package:flutter/material.dart';
import 'dart:async';

class TimerCounter extends StatefulWidget {
  @override
  _TimerCounterState createState() => _TimerCounterState();
}

class _TimerCounterState extends State<TimerCounter> {
  late Timer _timer;
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _isRunning = true; // to track if the timer is running or stopped

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    _startTimer();
  }

  void _startTimer() {
    // Create a timer that ticks every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Update the counter every tick
        if (_isRunning) {
          _seconds++;
          if (_seconds == 60) {
            _seconds = 0;
            _minutes++;
          }
          if (_minutes == 60) {
            _minutes = 0;
            _hours++;
          }
        }
      });
    });
  }

  void _stopTimer() {
    _timer.cancel(); // cancel the timer
    setState(() {
      _isRunning = false; // update the state to indicate timer is stopped
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Timer',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            '$_hours h : $_minutes m : $_seconds s',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _stopTimer, // stop the timer when button is pressed
            child: Text(_isRunning ? 'Stop Timer' : 'Timer Stopped'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }
}
