import 'dart:io';

class IOHelper {
  static String getInput(String prompt) {
    stdout.write(prompt);
    return stdin.readLineSync() ?? '';
  }
}
