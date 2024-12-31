import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:zap_the_gap/ui/pomodoro_page.dart';

class MotivationPage extends StatelessWidget {
  const MotivationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motivation & Study Techniques'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Motivational Quotes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            QuoteCard(
                quote:
                    "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful."),
            SizedBox(height: 10),
            QuoteCard(quote: "The future depends on what you do today."),
            SizedBox(height: 20),
            Text(
              'Study Techniques',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            TechniqueCard(
              technique: "Pomodoro Technique",
              description:
                  "Work for 25 minutes, then take a 5-minute bvreak. Repeat this cycle.",
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PomodoroScreen()),
                );
              },
              child: Text('Open Pomodoro Timer'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String quote;

  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          quote,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TechniqueCard extends StatelessWidget {
  final String technique;
  final String description;

  const TechniqueCard(
      {Key? key, required this.technique, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              technique,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}