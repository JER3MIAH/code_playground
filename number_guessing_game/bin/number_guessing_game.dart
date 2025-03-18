import 'dart:math';

import 'package:io_helper/io_helper.dart';

void main() {
  final ioHelper = IOHelper();
  final random = Random();
  print("\nNumber Guessing Game");
  print("1. Start Game");
  print("2. Exit");

  String option = ioHelper.getInput('Enter option: ');

  startGame() {
    int number = random.nextInt(101);
    String input = ioHelper.getInput('Guess the number: ');

    while (number.toString() != input) {
      bool isInt = int.tryParse(input) is int;
      String text = '';
      if (!isInt) {
        text = 'Input must be a number between 0 and 100\nTry again: ';
      } else {
        text = 'Try again: ';
      }

      if (int.parse(input) > number) {
        text = 'Colder...\nTry again: ';
      } else if (int.parse(input) < 0) {
        text = 'Going below zero? Really?\nTry again: ';
      } else {
        text = 'Warmer...\nTry again: ';
      }
      input = ioHelper.getInput(text);
    }
    print('Woahh! Correct!');
  }

  switch (option) {
    case '1':
      startGame();
    case '2':
      print('Okay, Bye');
      return;
    default:
      print('Invalid option, Please try again.');
  }
}
