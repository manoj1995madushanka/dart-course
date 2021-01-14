import 'dart:convert' show utf8;

import 'dart:io';

void main(List<String> arguments)
{
  String data ="";
  for(int i =0 ;i<100;i++)
    {
      data += "Hellow world \r\n";
    }

  List original = utf8.encode(data);

  List compressed = gzip.encode(original);

  List decompressed = gzip.decode(compressed);

  print("original ${original.length} bytes");
  print("compressed ${compressed.length} bytes");
  print("decompressed ${decompressed.length} bytes");

  String decoded = utf8.decode(original);
  assert(decoded == data);

}