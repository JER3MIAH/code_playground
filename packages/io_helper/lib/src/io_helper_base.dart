import 'dart:io';

class IOHelper {
  String getInput(String prompt) {
    stdout.write(prompt);
    return stdin.readLineSync() ?? '';
  }
}
