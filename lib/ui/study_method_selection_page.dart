import 'package:flutter/material.dart';
import 'pomodoro_page.dart';
import 'deep_work_screen.dart';

class StudyMethodSelectionPage extends StatelessWidget {
  const StudyMethodSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Study Method'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Pomodoro Technique'),
            subtitle: const Text('Study with focused sessions and breaks.'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PomodoroScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Deep Work'),
            subtitle: const Text('Focus for long, uninterrupted periods.'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeepWorkScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Interleaved Learning'),
            subtitle: const Text('Alternate between topics while studying.'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Interleaved Learning method coming soon!'),
              ));
            },
          ),
        ],
      ),
    );
  }
}
