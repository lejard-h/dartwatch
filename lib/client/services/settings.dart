import 'dart:convert';

import 'package:angular2/angular2.dart';
import 'package:dartwatch/client/services.dart';
import 'package:dartwatch/models/post.dart';

@Injectable()
class Settings {
  LocalStorage _storage;
  final String _storageKey = "dartwatch-lKey";
  Map<String, dynamic> _map = {soSettingsKey: true, dartAcademySettingsKey: true, dartlangSettingsKey: true};

  Settings(this._storage) {
    _load();
  }

  bool get dartAcademy => _map[dartAcademySettingsKey];

  void set dartAcademy(bool v) {
    _map[dartAcademySettingsKey] = v;
    _save();
  }

  bool get dartlang => _map[dartlangSettingsKey];

  void set dartlang(bool v) {
    _map[dartlangSettingsKey] = v;
    _save();
  }

  bool get stackOverflow => _map[soSettingsKey];

  void set stackOverflow(bool v) {
    _map[soSettingsKey] = v;
    _save();
  }

  Map<String, String> toMapString() {
    Map<String, String> map = {};
    _map.forEach((String key, value) {
      map[key] = value?.toString();
    });
    return map;
  }

  _load() {
    if (_storage.hasKey(_storageKey)) {
      _map = JSON.decode(_storage.readString(_storageKey));
    } else {
      _save();
    }
  }

  _save() {
    _storage.saveString(_storageKey, JSON.encode(_map));
  }

  bool hasOnlyFalse() => _map.values.every((bool v) => v == false);
}
