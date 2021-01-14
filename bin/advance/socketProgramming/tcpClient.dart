import 'dart:io';

void main (List<String> arguments) async
{
  var socket = await Socket.connect('127.0.0.1', 3000);
  print('connected');
  socket.write('hello world');
  print('send, closing.');
  await socket.close();
  print('closed');
}