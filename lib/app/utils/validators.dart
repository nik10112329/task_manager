import 'package:email_validator/email_validator.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';

class Validators {
  const Validators._();

  static bool isEmail(String input) => EmailValidator.validate(input);

  static bool isPhone(String input) => RegExp(
    r'(^[+]?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$)',
  ).hasMatch(input);

  static bool isNotEmpty(String input) => input != '' && input.isNotEmpty;

  static bool tagValidator(
    String value, {
    required List<dynamic> existingTags,
  }) {
    if (value.isEmpty) return true;

    final trimmed = value.trim();

    if (trimmed == '#' || trimmed == '# ') {
      return true;
    }

    final inputUpper = trimmed.toUpperCase();

    return existingTags.any((tag) {
      if (tag is Map) {
        return tag['id'] == trimmed ||
            tag['name']?.toString().toUpperCase() == inputUpper;
      } else if (tag is TMTaskTag) {
        return tag.name.toUpperCase() == inputUpper || tag.id == trimmed;
      } else {
        return false;
      }
    });
  }
}
