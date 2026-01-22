class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  static String? validateCardNumber(String? value) {
    if (value == null || value.length < 16) return 'Invalid Card Number';
    return null;
  }
}
