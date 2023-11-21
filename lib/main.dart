import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:pet_health/state/NavigationState.dart';
import 'package:provider/provider.dart';

import 'pages/home/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationState(),
      child: I18n(
        initialLocale: const Locale('pt', 'BR'),
        child: const PetHealthApp(),
      )
    )
  );
}
