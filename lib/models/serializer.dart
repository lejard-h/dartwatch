import 'package:serializer/serializer_codegen.dart';
import 'package:serializer/codecs.dart';
import 'post.codec.dart';

export 'package:serializer/serializer_codegen.dart';

Serializer serializer = new CodegenSerializer.typedJson()
  ..addTypeCodec(DateTime, new DateTimeUtcCodec())
  ..addAllTypeCodecs(lib_models_post_codecs);
