import 'dart:async';
import '../services/notification_service.dart';

class PomodoroService {
  static const int studyDuration = 25 * 60; // 25 minutes in seconds
  static const int breakDuration = 5 * 60; // 5 minutes in seconds

  int _timeRemaining = studyDuration;
  bool _isStudyTime = true;
  Timer? _timer;

  final NotificationService _notificationService = NotificationService();

  int get timeRemaining => _timeRemaining;
  bool get isStudyTime => _isStudyTime;

  void startTimer(void Function() updateUI) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        _timeRemaining--;
        updateUI();
      } else {
        _timer?.cancel();
        _sendNotification();
        _switchMode();
        startTimer(updateUI); // Automatically start the next session
      }
    });
  }

  void _switchMode() {
    _isStudyTime = !_isStudyTime;
    _timeRemaining = _isStudyTime ? studyDuration : breakDuration;
  }

  void _sendNotification() {
    if (_isStudyTime) {
      _notificationService.showNotification(
        "Break Time's Up!",
        "Time to go back to studying!",
      );
    } else {
      _notificationService.showNotification(
        "Time to Take a Break :)",
        "Relax and recharge!",
      );
    }
  }

  void stopTimer() {
    _timer?.cancel();
  }
}
