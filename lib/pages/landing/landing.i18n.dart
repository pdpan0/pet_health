import 'package:i18n_extension/i18n_extension.dart';

const notifications = 'notifications';
const management = 'management';

extension Localization on String {

  static const _t = Translations.from('en_us', {
    notifications: {
      'en_us': 'Notifications',
      'pt_br': 'Notificações'
    },
    management: {
      'en_us': 'Manage your pets',
      'pt_br': 'Gerencie seus animais de estimação'
    }
  });

  String get i18n => localize(this, _t);
}
