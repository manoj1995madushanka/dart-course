import 'dart:convert';

import 'dart:io';

void main(List<String> arguments)
{
  int zlibLen = testCompress(zlib);
  int gzipLen = testCompress(gzip);

  print("zlib ${zlibLen}");
  print("gzip ${gzipLen}");

  // zlib is best for compress but it is slower than gzip
}

int testCompress(var codec)
{
  String data = generateData();

  List original = utf8.encode(data);
  List compressed = codec.encode(original);
  List decompressed = codec.decode(compressed);

  print("Testing ${codec.toString()}");
  print("original ${original.length}");
  print("compressed ${compressed.length}");
  print("decompressed ${decompressed.length}");
  print("\n");

  String decoded = utf8.decode(original);
  assert(decoded == data);

  return compressed.length;
}

String generateData()
{
  String data ="";
  for(int i =0 ;i<100;i++)
  {
    data += "Hellow world \r\n";
  }
  return data;
}