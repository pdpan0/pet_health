import 'package:i18n_extension/i18n_extension.dart';

const namePlaceholder = 'nameHintText';
const nameValidatorError = 'nameValidatorError';
const racePlaceholder = 'racePlaceholder';
const saveButton = 'saveButton';

extension Localization on String {

  static const _t = Translations.from('en_us', {
    namePlaceholder: {
      'en_us': 'Name',
      'pt_br': 'Nome'
    },
    nameValidatorError: {
      'en_us': 'Invalid pet name',
      'pt_br': 'Nome do pet inválido'
    },
    racePlaceholder: {
      'en_us': 'Race',
      'pt_br': 'Raça'
    },
    saveButton: {
      'en_us': 'Save',
      'pt_br': 'Salvar'
    }
  });

  String get i18n => localize(this, _t);
}
