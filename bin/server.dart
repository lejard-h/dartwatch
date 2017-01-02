import 'dart:io';
import 'package:jaguar/jaguar.dart' as jaguar;
import 'package:dartwatch/server/api.dart';

main(List<String> args) async {
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);
  jaguar.Configuration configuration = new jaguar.Configuration(multiThread: false, port: port);
  configuration.addApi(new DartWatchApi());

  await jaguar.serve(configuration);
}
