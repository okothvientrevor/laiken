class VFirebaseAuthException implements Exception {
  final String code;
  VFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'The user has been disabled.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      default:
        return 'An unknown error occurred.';
    }
  }

  @override
  String toString() => 'VFirebaseAuthException: $message';
}

class VFirebaseException implements Exception {
  final String code;
  VFirebaseException(this.code);

  String get message {
    // You can customize messages based on the Firebase error code
    return 'Firebase exception occurred: $code';
  }

  @override
  String toString() => 'VFirebaseException: $message';
}

class VFormatException implements Exception {
  const VFormatException();

  String get message => 'Invalid format.';

  @override
  String toString() => 'VFormatException: $message';
}

class VPlatformException implements Exception {
  final String code;
  VPlatformException(this.code);

  String get message {
    // You can customize messages based on the Platform error code
    return 'Platform exception occurred: $code';
  }

  @override
  String toString() => 'VPlatformException: $message';
}
