import 'dart:async';

int counter =0;

void main(List<String> arguments)
{
  Duration duration = new Duration(seconds: 1);
  Timer timer = new Timer.periodic(duration, timeOut);
  print("started : ${getTime()}");
}

void timeOut(Timer t)
{
  print("timeout : ${getTime()}");
  counter++;
  if(counter>=5) t.cancel();
}

String getTime()
{
  DateTime dt = DateTime.now();
  return dt.toString();
}