import 'package:flutter/material.dart';
import 'package:pet_health/pages/components/pet_avatar.dart';

import '../components/change_locale.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({super.key});

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  final List<String> mock = <String>[
    'O aniversário do seu pet está chegando!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: _getAppBar()),
      body: _getBody(),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0,
      actions: const [ChangeLocaleComponent()],
    );
  }

  Widget _getBody() {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Column(
          children: <Widget>[
            Container(
              width: size.width,
              height: 250,
              padding: const EdgeInsets.all(15.0),
              child: PetAvatar(borderRadius: 100, radius: 95),
            ),
          ],
        ),
      ],
    );
  }
}
