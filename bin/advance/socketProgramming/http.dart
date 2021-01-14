import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments)
{
  httpGet();
  httpPost();
}

void httpGet() async
{
  var url = 'http://google.lk';
  var response = await http.get(url);
  print('response status ${response.statusCode} response body ${response.body}');
}

void httpPost() async
{
  var url = 'http://httpbin.org/post';
  var response = await http.post(url,body:'name=Manoj&color=blue');
  print(response);

}