/*Compress some data using GZIP or ZLIB and write it to a file,
 then decompress it and print it on the screen.*/

import 'dart:convert';
import 'dart:io';

void main(List<String> arguments)
{
  String compressed = Directory.current.path + '/compressed.txt';

  File file = new File(compressed);
  file.createSync();
  file.writeAsBytesSync(gzip.encode(utf8.encode('Hello world')));

  print(utf8.decode(gzip.decode(file.readAsBytesSync())));
}