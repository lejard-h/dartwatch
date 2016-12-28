import 'package:jaguar/jaguar.dart' as jaguar;
import 'package:darty/server/api.dart';

main() async {
  jaguar.Configuration configuration = new jaguar.Configuration(multiThread: false);
  configuration.addApi(new DartyApi());

  await jaguar.serve(configuration);
}
