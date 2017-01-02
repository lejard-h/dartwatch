//import 'dart:html';
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

  FeedSidenav(this.settings);
}
