import 'package:http/http.dart' as http;

void main(List<String> arguments)
{
  printSource();
}

void printSource()
{
  var url = 'https://www.google.lk/';

  http.get(url).then((value)  {
    print('Response status: ${value.statusCode}');
    print('Response status: ${value.body}');
  });
}