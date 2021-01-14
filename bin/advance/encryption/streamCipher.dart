import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:collection/collection.dart';

import 'derivingKeys.dart';
import 'secureRandomNumbers.dart';

void main(List<String> arguments)
{
  final keybytes = randomBytes(16);
  final key = new KeyParameter(keybytes);

  final iv = randomBytes(8);
  final params = new ParametersWithIV(key, iv);

  StreamCipher cipher = new StreamCipher("Salsa20");
  cipher.init(true, params);

  // Encrypt
  String plainText = "Hello world";
  Uint8List plain_data = createUint8ListFromString(plainText);
  Uint8List encrypted_data =cipher.process(plain_data);

  // Decrypt
  cipher.reset();
  cipher.init(false, params);
  Uint8List decryptedData = cipher.process(encrypted_data);

  displayUint8List('Plain text',plain_data);
  displayUint8List('Encrypted data',encrypted_data);
  displayUint8List('Decrypted data',decryptedData);

  // make sure they match
  Function eq = const ListEquality().equals;
  assert(eq(plain_data,decryptedData));
}

Uint8List createUint8ListFromString(String value) => new Uint8List.fromList(utf8.encode(value));

void displayUint8List(String title, Uint8List value)
{
  print(title);
  print(value);
  print(base64.encode(value));
  print('');
}

Uint8List randomBytes(int length)
{
  final rnd = new SecureRandom("AES/CTR/AUTO-SEED-PRING");

  final key = new Uint8List(16);
  final keyParam = new KeyParameter(key);
  final param = new ParametersWithIV(keyParam, new Uint8List(16));

  rnd.seed(param);

  var random = new Random();
  for(int i = 0;i<random.nextInt(255);i++)
  {
    rnd.nextUint8();
  }

  var bytes = rnd.nextBytes(length);
  return bytes;

}