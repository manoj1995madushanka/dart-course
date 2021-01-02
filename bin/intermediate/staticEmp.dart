class Employee{
  int _counter =0;
  static int _scounter =0;

  Employee()
  {
    _counter++;
    _scounter++;
    print("employee counter is ${_counter} and scounter is ${_scounter}");
  }
}

void main(List<String> argumets)
{
  Employee e1 = new Employee();
  Employee e2 = new Employee();
}

