import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
  selector: 'numbers',
  templateUrl: 'numbers.html',
  styleUrls: const <String>['numbers.css'])
class Numbers implements OnInit {

  static const String route_name = "Numbers";
  static const String route_path = "Numbers";
  static const Route route = const Route(path: Numbers.route_path,
      component: Numbers,
      name: Numbers.route_name);

  Numbers();

  @override
  void ngOnInit() {}

}
