import 'dart:html';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:darty/models/post.dart';

@Component(
    selector: 'feed-sidenav',
    templateUrl: 'feed_sidenav.html',
    styleUrls: const <String>['feed_sidenav.css'],
    directives: const [materialDirectives],
    providers: const [materialProviders])
class FeedSidenav {
  @Input()
  Settings settings;

  FeedSidenav();
}

class Settings {
  final String _storageKey = "strdhfjghkb";
  Map<String, dynamic> _map = {soSettingsKey: true, dartAcademySettingsKey: true, dartlangSettingsKey: true};

  Map<String, String> toMapString() {
    Map<String, String> map = {};
    _map.forEach((String key, value) {
      map[key] = value?.toString();
    });
    return map;
  }

  Settings() {
    _load();
  }

  _load() {
    if (window.localStorage.containsKey(_storageKey)) {
      _map = JSON.decode(window.localStorage[_storageKey]);
    } else {
      _save();
    }
  }

  _save() {
    window.localStorage[_storageKey] = JSON.encode(_map);
  }

  bool get stackOverflow => _map[soSettingsKey];

  bool get dartlang => _map[dartlangSettingsKey];

  bool get dartAcademy => _map[dartAcademySettingsKey];

  void set stackOverflow(bool v) {
    _map[soSettingsKey] = v;
    _save();
  }

  void set dartlang(bool v) {
    _map[dartlangSettingsKey] = v;
    _save();
  }

  void set dartAcademy(bool v) {
    _map[dartAcademySettingsKey] = v;
    _save();
  }
}
