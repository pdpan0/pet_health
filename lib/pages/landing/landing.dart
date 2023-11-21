import 'package:flutter/material.dart';
import 'package:pet_health/pages/components/pet_avatar.dart';
import 'package:pet_health/pages/landing/landing.i18n.dart';

import '../components/change_locale.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({super.key});

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  final padding = const EdgeInsets.all(15.0);

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
              padding: padding,
              child: PetAvatar(borderRadius: 100, radius: 95),
            ),
            Center(
              child: Text(management.i18n),
            )
          ],
        ),
      ],
    );
  }
}
