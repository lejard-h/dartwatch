import 'package:jaguar/jaguar.dart' as jaguar;
import 'package:dartwatch/server/api.dart';
import 'package:args/args.dart';

main(List<String> args) async {
  ArgParser parser = new ArgParser()..addOption("port", defaultsTo: "8080");
  ArgResults results = parser.parse(args);
  num port = num.parse(results["port"]);
  jaguar.Configuration configuration = new jaguar.Configuration(multiThread: false, port: port);
  configuration.addApi(new DartWatchApi());

  await jaguar.serve(configuration);
}
