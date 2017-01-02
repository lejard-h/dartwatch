import 'package:jaguar/jaguar.dart' as jaguar;
import 'package:dartwatch/server/api.dart';

main() async {
  jaguar.Configuration configuration = new jaguar.Configuration(multiThread: false);
  configuration.addApi(new DartWatchApi());

  await jaguar.serve(configuration);
}
