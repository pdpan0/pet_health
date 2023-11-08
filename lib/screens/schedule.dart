import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Health'),
      ),
      body: const Center(
        child: Text('Schedule Widget'),
      ),
      backgroundColor: Colors.blueGrey.shade200,
    );
  }
}
