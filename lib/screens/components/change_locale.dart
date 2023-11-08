import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:pet_health/constants/assets.dart';
import 'package:pet_health/screens/components/circular_button.dart';

class ChangeLocaleComponent extends StatefulWidget {
  const ChangeLocaleComponent({super.key});

  @override
  State<ChangeLocaleComponent> createState() => _ChangeLocaleComponentState();
}

class _ChangeLocaleComponentState extends State<ChangeLocaleComponent> {
  // todo: dinâmico
  final _locales = const [
    { 'locale': Locale('en', 'US'), 'icon': usa_flag },
    { 'locale': Locale('pt', 'BR'), 'icon': bra_flag },
  ];

  Map<String, Object>? _currentLocale;

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
          assetName: _currentLocale!['icon'] as String,
          onTap: () {
            final locale = _locales.firstWhere((element) => element != _currentLocale)['locale'] as Locale;
            _setLocale(locale);
          }
      ),
    );
  }

  Map<String, Object>? _findLocale(Locale locale) {
    return _locales.firstWhere((element) => element['locale'] == I18n.locale);
  }

  void _setLocale(Locale locale) {
    I18n.of(context).locale = locale;

    setState(() {
      _currentLocale = _findLocale(locale);
    });
  }
}