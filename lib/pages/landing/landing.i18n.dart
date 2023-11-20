import 'package:i18n_extension/i18n_extension.dart';

const notifications = 'notifications';

extension Localization on String {

  static const _t = Translations.from('en_us', {
    notifications: {
      'en_us': 'Notifications',
      'pt_br': 'Notificações'
    }
  });

  String get i18n => localize(this, _t);
}
