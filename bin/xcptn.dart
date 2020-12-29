import 'dart:io';

void main(List<String> arguments) {
  try {
    int age = askAge();
    if (age < 18) throw new Exception('too young');
    if (age > 98) throw new Exception('too old');

    print('you are continue');
  } catch (e) {
    print('e:${e.toString()}');
  } finally {
    print('good bye');
  }
}

int askAge() {
  print('Enter an age: ');
  return int.parse(stdin.readLineSync(), onError: (String err) {
    print('not a number');
    return 0;
  });
}
