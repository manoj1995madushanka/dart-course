import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:pointycastle/export.dart';

void main(List<String> arguments)
{
  String password = 'password';

  // when salt is changed encoded value will modify so salt act like key for password
  var salt = createUint8ListFromString('salt');
  var pkcs = new KeyDerivator("SHA-1/MMAC/PBKDF2");
  var params = new Pbkdf2Parameters(salt, 100, 16); // 16 is block size

  pkcs.init(params);

  Uint8List key = pkcs.process(createUint8ListFromString(password));

  display("Key value", key);
}

Uint8List createUint8ListFromString(String value) => new Uint8List.fromList(utf8.encode(value));

void display(String title, Uint8List value)
{
  print(title);
  print(value);
  print(base64.encode(value));
  print('');
}

