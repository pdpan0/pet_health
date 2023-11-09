import 'package:flutter/material.dart';
import 'package:pet_health/constants/colors.dart';
import 'package:pet_health/pages/components/pet_avatar.dart';
import 'package:pet_health/pages/landing/landing.i18n.dart';

import '../components/change_locale.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({super.key});

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0,
      actions: const [
        ChangeLocaleComponent()
      ],
    );
  }

  Widget _getBody() {
    final size = MediaQuery.of(context).size;
    return Column(
        children: [
          _getAppBar(),
          Container(
            width: double.infinity,
            height: size.height * 0.25,
            decoration: const BoxDecoration(color: primary),
            child: const Center(
                child: PetAvatar(
                  petInitials: 'AB',
                )),
          )
        ]
    );
  }
}
