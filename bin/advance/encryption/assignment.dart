/*Use Salsa20 to encrypt a string, then use SHA-256 to compare the plain text to the encrypted text.*/

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:collection/collection.dart';

import 'derivingKeys.dart';
import 'secureRandomNumbers.dart';

void main(List<String> arguments)
{
  final keyBytes = randomBytes(16);
  final key = new KeyParameter(keyBytes);
  final iv = randomBytes(8);
  final params = new ParametersWithIV(key, iv);

  StreamCipher cipher = new StreamCipher("Salsa20");
  cipher.init(true, params);

  Uint8List plain_text = createUint8ListFromString('Hello world');
  Uint8List encrypted_data = cipher.process(plain_text);

  cipher.reset();
  cipher.init(false, params);

  Uint8List decrypted_data = cipher.process(encrypted_data);

  Digest digest = new Digest("SHA-256");
  assert(base64.encode(digest.process(plain_text)) == base64.encode(digest.process(decrypted_data)));

  print("encryption and decryption matches");
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

