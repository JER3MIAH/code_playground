import 'package:io_helper/io_helper.dart';

void main() {
  final ioHelper = IOHelper();

  String name = ioHelper.getInput('What is your name? ');
  print('Hello $name');
}
