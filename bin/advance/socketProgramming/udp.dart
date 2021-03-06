import 'dart:convert';

import 'dart:io';

void main(List<String> arguments)
{
  var data = 'Hello world';

  List<int> dataToSend = utf8.encode(data);
  int port = 3000;

  // server
  RawDatagramSocket.bind(InternetAddress.LOOPBACK_IP_V4, port)
  .then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if(event == RawSocketEvent.READ)
        {
          Datagram dg = udpSocket.receive();
          print(utf8.decode(dg.data));
        }
    });

    // client
    udpSocket.send(dataToSend, InternetAddress.LOOPBACK_IP_V4, port);
    print('send');
  });



}