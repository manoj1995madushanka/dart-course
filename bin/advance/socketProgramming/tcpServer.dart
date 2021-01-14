import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async
{
  var serverSocket = await ServerSocket.bind('127.0.0.1', 3000);
  print('Listening...');

  await for( var socket in serverSocket)
    {
      socket.listen((List event) {
        print('${socket.remoteAddress} : ${socket.remotePort} = ${utf8.decode(event)}');
      });
    }
}

// open powershel and enable telnet using below command
// dism /online /Enable-Feature /FeatureName:TelnetClient

// after run telnet 127.0.0.1 3000