/*Download a web page using HTTP Get and display the length.*/

import 'package:http/http.dart' as http;

void main(List<String> arguments) async
{
  var url = 'http://www.google.lk';
  var response = await http.get(url);
  print('length : ${response.body.length}');
}