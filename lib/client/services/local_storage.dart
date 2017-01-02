import 'dart:convert';
import 'dart:html';

import 'package:angular2/angular2.dart';

@Injectable()
class LocalStorage {
  Storage get _storage => window.localStorage;

  bool hasKey(String key) => _storage.containsKey(key);

  bool hasValueString(String value) => _storage.containsValue(value);

  String readString(String key) => _storage[key];

  String remove(String key) => _storage.remove(key);

  String saveString(String key, String value) => _storage[key] = value;

  Object saveObject(String key, Object value) {
    saveString(key, _convertObjectValue(value));
    return value;
  }

  bool hasValueObject(Object value) => _storage.containsValue(_convertObjectValue(value));

  String _convertObjectValue(Object value) {
    if (value is Map || value is List) {
      return JSON.encode(value);
    } else if (value is String) {
      return value;
    }
    throw new Exception("Object (${value.runtimeType}) is not encodable.");
  }
}
