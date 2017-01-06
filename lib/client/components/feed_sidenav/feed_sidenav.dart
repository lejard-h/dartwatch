//import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:dartwatch/client/services.dart';

@Component(
    selector: 'feed-sidenav',
    templateUrl: 'feed_sidenav.html',
    styleUrls: const <String>['feed_sidenav.css'],
    directives: const [materialDirectives],
    providers: const [materialProviders])
class FeedSidenav {

  Settings settings;
  FeedService _feedService;

  Future<Null> _onSettingsChange() async {
    int limit = FeedService.pull_feed_limit;
    while (_feedService.filteredFeed?.isEmpty == true && !settings.hasOnlyFalse()) {
      await _feedService.fetchNext(limit: limit);
      limit += 5;
    }
  }

  void stOnChange(bool value) {
    settings.stackOverflow = value;
    _onSettingsChange();
  }

  void daOnChange(bool value) {
    settings.dartAcademy = value;
    _onSettingsChange();
  }

  void dnOnChange(bool value) {
    settings.dartlang = value;
    _onSettingsChange();
  }


  FeedSidenav(this.settings, this._feedService);
}
