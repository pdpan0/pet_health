import 'package:i18n_extension/i18n_extension.dart';

const namePlaceholder = 'nameHintText';
const nameValidatorError = 'nameValidatorError';
const breedPlaceholder = 'breedPlaceholder';
const breedValidatorError = 'breedValidatorError';
const saveButton = 'saveButton';
const removeWithSuccess = 'removeWithSuccess';

extension Localization on String {
  static const _t = Translations.from('en_us', {
    namePlaceholder: {'en_us': 'Name', 'pt_br': 'Nome'},
    nameValidatorError: {
      'en_us': 'Invalid pet name',
      'pt_br': 'Nome do pet inválido'
    },
    breedPlaceholder: {'en_us': 'Breed', 'pt_br': 'Raça'},
    breedValidatorError: {
      'en_us': 'Breed cannot be invalid',
      'pt_br': 'Raça não pode ser inválida'
    },
    saveButton: {'en_us': 'Save', 'pt_br': 'Salvar'},
    removeWithSuccess: {
      'en_us': 'Pet was removed successfully',
      'pt_br': 'Pet removido com sucesso'
    },
  });

  String get i18n => localize(this, _t);
}
