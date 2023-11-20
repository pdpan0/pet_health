import 'package:i18n_extension/i18n_extension.dart';

const namePlaceholder = 'nameHintText';
const nameValidatorError = 'nameValidatorError';
const breedPlaceholder = 'breedPlaceholder';
const breedValidatorError = 'breedValidatorError';
const saveButton = 'saveButton';
const createWithSuccess = 'createWithSuccess';
const createWithError = 'createWithError';

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
    createWithSuccess: {
      'en_us': 'Pet was created with successfuly',
      'pt_br': 'Pet criado com sucesso'
    },
    createWithError: {
      'en_us': 'Occurs an error in register',
      'pt_br': 'Ocorreu um erro no cadastro'
    }
  });

  String get i18n => localize(this, _t);
}
