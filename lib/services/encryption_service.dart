import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart' as encrypt;

abstract class EncryptionService {
  genarateRandomId();
  encryptPassword({String password, String? keyString});
  decryptPassword({String encrptedPassword, String? keyString});
}

class EncryptionServiceImpl extends EncryptionService {
  final Random _random = Random.secure();

  @override
  decryptPassword({String? encrptedPassword, String? keyString}) {
    if (encrptedPassword != null && keyString != null) {
      if (keyString.length < 32) {
        int count = 32 - keyString.length;
        for (var i = 0; i < count; i++) {
          keyString = "${keyString!}.";
        }
      }
      final iv = encrypt.IV.fromLength(16);

      final key = encrypt.Key.fromUtf8(keyString ?? "");

      final encrypter = encrypt.Encrypter(encrypt.AES(key));

      return encrypter.decrypt64(encrptedPassword, iv: iv);
    }
  }

  @override
  encryptPassword({String? password, String? keyString}) {
    if (keyString != null && password != null) {
      if (keyString.length < 32) {
        int count = 32 - keyString.length;
        for (var i = 0; i < count; i++) {
          keyString = "${keyString!}.";
        }
      }

      final key = encrypt.Key.fromUtf8(keyString ?? "");

      final iv = encrypt.IV.fromLength(16);

      final encrypter = encrypt.Encrypter(encrypt.AES(key)); // encrypt the key
      final e = encrypter.encrypt(password, iv: iv); // encrypt password

      return e.base64.toString();
    }
  }

  @override
  genarateRandomId() {
    var values = List<int>.generate(16, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }
}
