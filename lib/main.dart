import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:pet_health/constants/routes.dart';
import 'package:pet_health/screens/landing/landing.dart';
import 'package:pet_health/screens/schedule.dart';

void main() {
  runApp(
      I18n(initialLocale: const Locale('en', 'US'), child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR')
      ],
      title: 'Pet Health',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        landing: (context) => const LandingWidget(),
        schedule: (context) => const ScheduleWidget()
      },
    );
  }
}
