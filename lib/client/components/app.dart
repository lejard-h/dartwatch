import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:darty/client/routes.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    styleUrls: const <String>['app.css'],
    directives: const [ROUTER_DIRECTIVES])
@RouteConfig(const <dynamic>[
  /*Insert Routes here*/
  Numbers.route,
  Main.route,
])
class App {}
