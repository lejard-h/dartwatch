import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:dartwatch/client/routes.dart';
import 'package:material2_dart/material.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    styleUrls: const <String>['app.css'],
    directives: const [ROUTER_DIRECTIVES, MdToolbar])
@RouteConfig(const <dynamic>[
  /*Insert Routes here*/
 // Numbers.route,
  Main.route,
])
class App {}
