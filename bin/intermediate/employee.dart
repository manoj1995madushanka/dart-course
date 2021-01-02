import 'dart:math';

class Employee{
  String _name;
  String _position;
  Employee(String name,String position)
  {
    this._name = name;
    this._position = position;
  }

  String get name => _name;
  void set name(String value) => this._name = value;

  
}

void main(List<String> arguments)
{
  Employee employee = new Employee("test", "SE");
  print("employee ${employee._name} is a ${employee._position}");
}