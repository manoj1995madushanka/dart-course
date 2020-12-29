import 'dart:io';

import 'package:hello/1.dart' as hello;

void main(List<String> arguments) {
  List test = ['ABC', 'DEF'];
  print("enter index : ");
  int index = int.parse(stdin.readLineSync());
  print('value is ${test[index]}');
}
