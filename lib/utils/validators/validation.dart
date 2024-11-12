class VValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email verification

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[a-zA-Z]{2,4}$');

    // if (!emailRegExp.hasMatch(value)) {
    //   return "Invalid email address.";
    // }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    //  check for minimum password length

    if (value.length < 6) {
      return "Password must be atleast 6 characters long.";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain atleast one number.";
    }

    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character.";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone Number is required.";
    }

    // Regular expression for phone number validation
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null;
  }
}
