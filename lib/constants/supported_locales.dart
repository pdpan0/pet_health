import 'dart:ui';

import 'package:pet_health/constants/assets.dart';
import 'package:pet_health/models/supported_locales.dart';

final supportedLocales = <SupportedLocales>[
  SupportedLocales(const Locale('en', 'US'), usa_flag),
  SupportedLocales(const Locale('pt', 'BR'), bra_flag),
];