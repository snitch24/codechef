import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

class TextFieldValidator {
  static String? name(String? name) {
    bool isNameValid = Fzregex.hasMatch(name!, FzPattern.name);
    if (name.isEmpty) {
      return 'Please enter your name';
    }
    if (isNameValid == false) {
      return 'Please enter your correct name';
    } else {
      return null;
    }
  }

  static String? email(String? mail) {
    bool isEmailValid = Fzregex.hasMatch(mail!, FzPattern.email);

    if (isEmailValid == false) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  static String? age(String? age) {
    bool isAgeValid = Fzregex.hasMatch(age!, FzPattern.numericOnly);
    if (isAgeValid) {
      return null;
    } else {
      return 'Please Enter a Valid age';
    }
  }
}
