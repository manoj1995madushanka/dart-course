import 'counter.dart';

void main(List<String> arguments)
{
  List<int> intList = new List<int>();
  intList.addAll([1,2,3,4]);
  print(intList);

  //add(1, 2);
  //add<int>(1,2);

  //add(1.2, 2.3);
  //add<double>(1.2, 2.3);

  //add("a", "b");
  add<String>("a", "b");

  Counter<int> ints = new Counter<int>();
  ints.addAll([1,2,3,4]);
  ints.total();

  Counter<double> doubles = new Counter<double>();
  doubles.addAll([1.2,2.3,3.5,4.7]);
  doubles.total();
}

void add<T extends String>(T a, T b)
{
  print(a + b);
}