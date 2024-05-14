import 'dart:math';
String generatePassKey(int length) {
  Random random = Random();
  const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String passKey = '';
  for (int i = 0; i < length; i++) {
    passKey += chars[random.nextInt(chars.length)];
  }
  return passKey;
}

String generateUserId(int length) {
  Random random = Random();
  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  int timestampLength = timestamp.length;
  
  // Ensure that the generated ID is 10 digits long
  if (timestampLength >= length) {
    return timestamp.substring(timestampLength - length);
  } else {
    String randomDigits = '';
    for (int i = 0; i < length - timestampLength; i++) {
      randomDigits += random.nextInt(10).toString();
    }
    return timestamp + randomDigits;
  }
}
