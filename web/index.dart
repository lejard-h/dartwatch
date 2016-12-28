import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';
import 'package:darty/client/components.dart';

main() {
  bootstrap(App, [
    ROUTER_PROVIDERS,
    const Provider(APP_BASE_HREF, useValue: ''),
    const Provider(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
