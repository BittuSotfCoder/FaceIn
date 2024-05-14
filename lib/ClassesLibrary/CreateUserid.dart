import 'dart:math';

class ClassesLibrary {
  String generatePassKey(int length) {
    Random random = Random();
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String passKey = '';
    for (int i = 0; i < length; i++) {
      passKey += chars[random.nextInt(chars.length)];
    }
    return passKey;
  }

}
