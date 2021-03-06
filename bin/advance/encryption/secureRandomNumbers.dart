import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';

void main(List<String> arguments)
{
  print(randomBytes(8));
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