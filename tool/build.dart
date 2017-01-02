import 'package:build/build.dart';
import 'package:jaguar_generator/phase/import.dart';
import 'package:serializer/build.dart' as ser;

const String library = "dartwatch";
const List<String> jaguar_files = const ['lib/server/api.dart'];
const List<String> models = const ["lib/models/post.dart"];

PhaseGroup getPhaseGroup() {
  return new PhaseGroup()
    ..addPhase(new Phase()..addAction(new ser.SerializerGeneratorBuilder(library), new InputSet(library, models)))
    ..addPhase(apisPhase(library, jaguar_files));
}

main() async {
  build(getPhaseGroup(), deleteFilesByDefault: true);
}
