import 'dart:io';
import 'package:jaguar/jaguar.dart' as jaguar;
import 'package:dartwatch/server/api.dart';
import 'package:jaguar_spa/jaguar_spa.dart';

main(List<String> args) async {
  bool isProd = false;
  if (args.isNotEmpty == true && args.first == "prod") {
    isProd = true;
  }
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 8080 : int.parse(portEnv);
  jaguar.Configuration configuration = new jaguar.Configuration(multiThread: false, port: port);
  configuration.addApi(new DartWatchApi());
  configuration.addApi(new JaguarSpa(isProd: isProd));

  await jaguar.serve(configuration);
}
