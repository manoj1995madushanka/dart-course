import 'manager.dart';
import 'cashier.dart';
import 'payroll.dart';

void main(List<String> arguments)
{
  Cashier cashier = new Cashier();
  Manager manager = new Manager();

  Payroll payroll = new Payroll();
  payroll.add(cashier);
  payroll.add(manager);

  payroll.print();
}