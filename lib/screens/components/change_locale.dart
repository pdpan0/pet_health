import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:pet_health/constants/supported_locales.dart';
import 'package:pet_health/models/supported_locales.dart';
import 'package:pet_health/screens/components/circular_button.dart';

class ChangeLocaleComponent extends StatefulWidget {
  const ChangeLocaleComponent({super.key});

  @override
  State<ChangeLocaleComponent> createState() => _ChangeLocaleComponentState();
}

class _ChangeLocaleComponentState extends State<ChangeLocaleComponent> {
  late SupportedLocales _currentLocale;

  @override
  void initState() {
    super.initState();
    _currentLocale = _findLocale(I18n.locale);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CircularButton(
          backgroundImage: AssetImage(_currentLocale.flag),
          onTap: _changeLocale
      ),
    );
  }

  SupportedLocales _findLocale(Locale locale) {
    return supportedLocales.firstWhere((element) => element.locale == locale);
  }

  void _changeLocale() {
    _setLocale(
        supportedLocales.firstWhere((element) => element.locale != _currentLocale.locale).locale // todo: each-position of list
    );
  }

  void _setLocale(Locale locale) {
    I18n.of(context).locale = locale;

    setState(() {
      _currentLocale = _findLocale(locale);
    });
  }
}