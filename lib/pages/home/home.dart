import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/routes.dart';
import '../../constants/supported_locales.dart';
import '../../models/components/bottom_bar_item.dart';
import '../components/bottom_bar.dart';
import '../landing/landing.dart';
import '../pet/list/list.dart';
import '../pet/create/create.dart';
import '../schedule.dart';

class PetHealthApp extends StatefulWidget {
  const PetHealthApp({super.key});

  @override
  State<PetHealthApp> createState() => _PetHealthAppState();
}

class _PetHealthAppState extends State<PetHealthApp> {
  static final List<Widget> _pages = <Widget>[
    const LandingWidget(),
    const PetsListWidget(),
    const PetFormWidget(),
  ];

  int _currentPage = 0;
  final _pets = <BottomBarItem>[
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
        petForm: (context) => const PetFormWidget(),
        petList: (context) => const PetsListWidget()
      },
      home: Scaffold(
        body: _pages[_currentPage],
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onItemTapped(
              2), // todo: vincular o indice as telas, deixando de ser posicional
          backgroundColor: primary,
          child: const Icon(Icons.add, size: 25),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(
          activeIndex: _currentPage,
          items: _pets,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
