import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/routes.dart';
import '../../constants/supported_locales.dart';
import '../../models/components/bottom_bar_item.dart';
import '../../state/navigation.state.dart';
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

  final _pets = <BottomBarItem>[
    BottomBarItem(Icons.pets),
    BottomBarItem(Icons.pets),
  ];

  void _onItemTapped(BuildContext context, int index) {
    Provider.of<NavigationState>(context, listen: false).navigate(index);
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
        body: _pages[Provider.of<NavigationState>(context).currentPage],
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onItemTapped(context, 2),
          backgroundColor: primary,
          child: const Icon(Icons.add, size: 25),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(
          activeIndex: Provider.of<NavigationState>(context).currentPage,
          items: _pets,
          onTap: (index) {
            _onItemTapped(context, index);
          },
        ),
      ),
    );
  }
}
