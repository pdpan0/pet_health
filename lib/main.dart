import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:pet_health/constants/colors.dart';
import 'package:pet_health/constants/routes.dart';
import 'package:pet_health/constants/supported_locales.dart';
import 'package:pet_health/models/components/bottom_bar_item.dart';
import 'package:pet_health/pages/components/bottom_bar.dart';
import 'package:pet_health/pages/landing/landing.dart';
import 'package:pet_health/pages/pet_form/pet_form.dart';
import 'package:pet_health/pages/schedule.dart';

void main() {
  runApp(
      I18n(
          initialLocale: const Locale('en', 'US'), //todo: remover
          child: const PetHealthApp()
      )
  );
}

class PetHealthApp extends StatefulWidget {
  const PetHealthApp({super.key});

  @override
  State<PetHealthApp> createState() => _PetHealthAppState();
}

class _PetHealthAppState extends State<PetHealthApp> {
  static final List<Widget> _pages = <Widget>[
    const LandingWidget(),
    const ScheduleWidget(),
    const PetFormWidget()
  ];

  int _currentPage = 0;
  final _pets = <BottomBarItem>[
    BottomBarItem(Icons.pets),
    BottomBarItem(Icons.pets),
    BottomBarItem(Icons.pets),
    BottomBarItem(Icons.pets),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: supportedLocales.map((e) => e.locale),
      title: 'Pet Health',
      routes: {
        landing: (context) => const LandingWidget(),
        schedule: (context) => const ScheduleWidget(),
        petForm: (context) => const PetFormWidget()
      },
      home: Scaffold(
        body: _pages[_currentPage],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomBar(
          activeIndex: _currentPage,
          items: _pets,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onItemTapped(2), // todo: vincular o indice as telas, deixando de ser posicional
          backgroundColor: primary,
          child: const Icon(Icons.add, size: 25),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}