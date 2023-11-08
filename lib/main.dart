import 'package:flutter/material.dart';
import 'package:pet_health/screens/landing.dart';
import 'package:pet_health/screens/schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const LandingWidget(),
        "/schedule": (context) => const ScheduleWidget()
      },
    );
  }
}
