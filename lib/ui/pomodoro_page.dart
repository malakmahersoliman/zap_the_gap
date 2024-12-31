import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';


class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  int _duration = 25 * 60; // Duration in seconds (25 minutes)
  bool _isRunning = false; // Track whether the timer is running
  late int _endTime; // End time for the countdown

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _endTime = DateTime.now().millisecondsSinceEpoch + _duration * 1000;
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isRunning)
              CountdownTimer(
                endTime: _endTime,
                onEnd: () {
                  // Show alert when timer ends
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Time\'s up!'),
                      content: const Text('Take a break! You worked hard!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  _resetTimer(); // Reset timer after alert
                },
                widgetBuilder: (_, time) {
                  if (time == null) {
                    return const Text('Time is up!', style: TextStyle(fontSize: 24));
                  }
                  return Text(
                    '${time.min}:${time.sec.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 48),
                  );
                },
              )
            else
              const Text(
                'Press Start to begin your Pomodoro session',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRunning ? null : _startTimer,
              child: const Text('Start'),
            ),
            ElevatedButton(
              onPressed: !_isRunning ? null : _resetTimer,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
