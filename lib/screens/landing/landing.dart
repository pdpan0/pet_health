import 'package:flutter/material.dart';
import 'package:pet_health/constants/routes.dart';
import 'package:pet_health/screens/components/pet_avatar.dart';
import 'package:pet_health/screens/landing/landing.i18n.dart';

import '../components/change_locale.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({super.key});

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _getAppBar(),
      ),
      body: Column(
        children: [
          const Center(
            child: PetAvatar(
              petInitials: 'AB',
            )),
          Text(greetings.i18n)
        ]
      ),
      backgroundColor: Colors.blueGrey.shade200,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicione seu Pet',
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, schedule),
      ),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0,
      actions: const [
        ChangeLocaleComponent()
      ],
    );
  }
}
