import 'dart:io';

void main(List<String> arguments)
{
  int number = getNum();
  printNums(number);
}

int getNum()
{
  print('provide your number : ');
  return int.parse(stdin.readLineSync());
}

void printNums(int number)
{
  for(int i=0;i<=number;i++)
    {
      print(i);
    }
}