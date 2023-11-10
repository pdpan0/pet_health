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
  final List<String> mock = <String>[
    'O aniversário do seu pet está chegando!',
    'O aniversário do seu pet está chegando!',
    'O aniversário do seu pet está chegando!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: _getAppBar()),
      body: _getBody(),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      actions: const [ChangeLocaleComponent()],
    );
  }

  Widget _getBody() {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.40,
          decoration: const BoxDecoration(color: primary),
          child: Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: 250,
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(color: primary),
                child: PetAvatar(borderRadius: 100, radius: 95),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: _getNotificationSection(),
          ),
        ),
      ],
    );
  }

  Widget _getNotificationSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 40, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            notifications.i18n,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView(
                shrinkWrap: true,
                children: mock.map((e) => _getNotificationItem(e)).toList()
            ),
          )
        ],
      ),
    );
  }

  Widget _getNotificationItem(String notification) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10)
          ]),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Text(notification),
        )));
  }
}
