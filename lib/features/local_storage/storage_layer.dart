import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:press/features/local_storage/secure_storage.dart';

final class SecureStorageLayer {
  static FlutterSecureStorage? _storage ;

  /// stores the value associated with its key encrypted in the disk
  static Future<void> putValue({required String key, required dynamic value}) async {
    _storage ??= SecureStorage.getInstance();
    print('i will write $value in this $key');
    if (value is int || value is double || value is bool) {
      await _storage?.write(key: key, value: value.toString());
      print('i wrote');
    } else if (value is List || value is Map || value is Set) {
      await _storage?.write(key: key, value: jsonEncode(value));
    }
    // for normal strings
    else {
      await _storage?.write(key: key, value: value);
    }
  }

  /// returns the value associated with that key, if not found ''(Empty String) is returned
  static Future<dynamic> getValue({required String key}) async {
    _storage ??= SecureStorage.getInstance();

    final String? value = await _storage?.read(key: key);
    print('the value in the storage is $value');

    if (value == null) {
      return null;
    } else {
      if (double.tryParse(value) != null) {
        return double.parse(value);
      } else if (int.tryParse(value) != null) {
        return int.parse(value);
      } else if (jsonDecode(value) is List) {
        // for List
        return List.from(jsonDecode(value));
      } else if (jsonDecode(value) is Map) {
        // Map or Set
        return Map.from(jsonDecode(jsonDecode(value)));

      }else if(jsonDecode(value) is Set){
        return Set.from(jsonDecode(value));
      }
      else if (value == 'true' || value == 'false') {
        return bool.fromEnvironment(value);
      } else {
        return value.toString();
      }
    }
  }

}
