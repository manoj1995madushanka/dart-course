import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:collection/collection.dart';

import 'derivingKeys.dart';
import 'secureRandomNumbers.dart';

void main(List<String> arguments)
{
  final key = randomBytes(16);
  final params = new KeyParameter(key);

  BlockCipher cipher = new BlockCipher("AES");
  cipher.init(true, params);

  String plaintext = 'Hello world';
  Uint8List plain_data = createUint8ListFromString(plaintext.padRight(cipher.blockSize));
  Uint8List encrypted_data = cipher.process(plain_data);

  cipher.reset();
  cipher.init(false, params);
  Uint8List decrypted_data = cipher.process(encrypted_data);

  displayUint8List('Plain text',plain_data);
  displayUint8List('Encrypted data',encrypted_data);
  displayUint8List('Decrypted data',decrypted_data);

  Function eq = const ListEquality().equals;
  assert(eq(plain_data,decrypted_data));
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