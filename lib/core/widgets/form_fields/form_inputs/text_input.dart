import 'package:formz/formz.dart';

enum TextInputValidationError { empty }

class TextInputz extends FormzInput<String, TextInputValidationError> {
  const TextInputz.pure() : super.pure('');
  const TextInputz.dirty([String value = '']) : super.dirty(value);

  @override
  TextInputValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : TextInputValidationError.empty;
  }
}
