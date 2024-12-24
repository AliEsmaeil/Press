final class TextFieldValidator{

  static String? ageValidation(String? value){
  if (value == null || value.isEmpty) {
  return 'Please enter your age';
  }

  final age = int.tryParse(value);
  if (age == null) {
  return 'Please enter a valid number';
  }

  if (age < 1 || age > 120) {
  return 'Please enter a valid age between 1 and 120';
  }

  return null;
  }
  static String? passwordValidator(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter the password';
    }
    return null;
  }

}