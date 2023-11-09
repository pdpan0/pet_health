import 'package:i18n_extension/i18n_extension.dart';

const appbarTitle = "appbarTitle";
const greetings = "greetings";

extension Localization on String {

  static const _t = Translations.from("en_us", {
    appbarTitle: {
      "en_us": "i18n Demo",
      "pt_br": "Demonstração i18n",
    },
    greetings: {
      "en_us": "Helo there",
      "pt_br": "Olá como vai",
    },
  });

  String get i18n => localize(this, _t);
}