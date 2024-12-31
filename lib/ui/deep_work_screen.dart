import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zap_the_gap/ui/theme.dart';


class DeepWorkScreen extends StatefulWidget {
  const DeepWorkScreen({Key? key}) : super(key: key);
  @override
  _DeepWorkScreenState createState() => _DeepWorkScreenState();
}

class _DeepWorkScreenState extends State<DeepWorkScreen> {
  int _elapsedTime = 0;
  Timer? _timer;

  void _startTimer() {
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _elapsedTime = 0;
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Work'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Elapsed Time',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            Text(
              _formatTime(_elapsedTime),
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _startTimer,
                  icon: Icon(Icons.play_arrow),
                  label: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomTheme.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _resetTimer,
                  icon: Icon(Icons.restart_alt),
                  label: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomTheme.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _stopTimer,
                  icon: Icon(Icons.stop),
                  label: Text('Stop'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomTheme.pink,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
