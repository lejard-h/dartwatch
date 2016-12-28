// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: SerializerGenerator
// Target: library
// **************************************************************************

library post.codec;

import 'package:serializer/core.dart' show Serializer, cleanNullInMap;
import 'package:serializer/codecs.dart';
import 'post.dart';

// **************************************************************************
// Generator: SerializerGenerator
// Target: class DartAcademyPost
// **************************************************************************

class DartAcademyPostCodec extends TypeCodec<DartAcademyPost> {
  @override
  DartAcademyPost decode(dynamic value, {Serializer serializer}) {
    DartAcademyPost obj = new DartAcademyPost();
    obj.title = (value['title'] ?? obj.title) as String;
    obj.content = (value['content'] ?? obj.content) as String;
    obj.link = (value['link'] ?? obj.link) as String;
    obj.authors = (serializer?.decode(value['authors'], type: String) ??
        obj.authors) as List<String>;
    obj.published = (serializer?.decode(value['published'], type: DateTime) ??
        obj.published) as DateTime;
    obj.updated = (serializer?.decode(value['updated'], type: DateTime) ??
        obj.updated) as DateTime;
    return obj;
  }

  @override
  dynamic encode(DartAcademyPost value,
      {Serializer serializer, bool useTypeInfo, bool withTypeInfo}) {
    Map<String, dynamic> map = new Map<String, dynamic>();
    if (serializer.enableTypeInfo(useTypeInfo, withTypeInfo)) {
      map[serializer.typeInfoKey] = typeInfo;
    }
    map['title'] = value.title;
    map['content'] = value.content;
    map['link'] = value.link;
    map['authors'] = value.authors;
    map['published'] = serializer?.toPrimaryObject(value.published,
        useTypeInfo: useTypeInfo, withTypeInfo: false);
    map['updated'] = serializer?.toPrimaryObject(value.updated,
        useTypeInfo: useTypeInfo, withTypeInfo: false);
    return cleanNullInMap(map);
  }

  @override
  String get typeInfo => 'DartAcademyPost';
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class StackoverflowPost
// **************************************************************************

class StackoverflowPostCodec extends TypeCodec<StackoverflowPost> {
  @override
  StackoverflowPost decode(dynamic value, {Serializer serializer}) {
    StackoverflowPost obj = new StackoverflowPost();
    obj.title = (value['title'] ?? obj.title) as String;
    obj.content = (value['content'] ?? obj.content) as String;
    obj.link = (value['link'] ?? obj.link) as String;
    obj.authors = (serializer?.decode(value['authors'], type: String) ??
        obj.authors) as List<String>;
    obj.published = (serializer?.decode(value['published'], type: DateTime) ??
        obj.published) as DateTime;
    obj.updated = (serializer?.decode(value['updated'], type: DateTime) ??
        obj.updated) as DateTime;
    obj.profileUrl = (value['profileUrl'] ?? obj.profileUrl) as String;
    return obj;
  }

  @override
  dynamic encode(StackoverflowPost value,
      {Serializer serializer, bool useTypeInfo, bool withTypeInfo}) {
    Map<String, dynamic> map = new Map<String, dynamic>();
    if (serializer.enableTypeInfo(useTypeInfo, withTypeInfo)) {
      map[serializer.typeInfoKey] = typeInfo;
    }
    map['title'] = value.title;
    map['content'] = value.content;
    map['link'] = value.link;
    map['authors'] = value.authors;
    map['published'] = serializer?.toPrimaryObject(value.published,
        useTypeInfo: useTypeInfo, withTypeInfo: false);
    map['updated'] = serializer?.toPrimaryObject(value.updated,
        useTypeInfo: useTypeInfo, withTypeInfo: false);
    map['profileUrl'] = value.profileUrl;
    return cleanNullInMap(map);
  }

  @override
  String get typeInfo => 'StackoverflowPost';
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class NewsDartlangPost
// **************************************************************************

class NewsDartlangPostCodec extends TypeCodec<NewsDartlangPost> {
  @override
  NewsDartlangPost decode(dynamic value, {Serializer serializer}) {
    NewsDartlangPost obj = new NewsDartlangPost();
    obj.title = (value['title'] ?? obj.title) as String;
    obj.content = (value['content'] ?? obj.content) as String;
    obj.link = (value['link'] ?? obj.link) as String;
    obj.authors = (serializer?.decode(value['authors'], type: String) ??
        obj.authors) as List<String>;
    obj.published = (serializer?.decode(value['published'], type: DateTime) ??
        obj.published) as DateTime;
    obj.updated = (serializer?.decode(value['updated'], type: DateTime) ??
        obj.updated) as DateTime;
    return obj;
  }

  @override
  dynamic encode(NewsDartlangPost value,
      {Serializer serializer, bool useTypeInfo, bool withTypeInfo}) {
    Map<String, dynamic> map = new Map<String, dynamic>();
    if (serializer.enableTypeInfo(useTypeInfo, withTypeInfo)) {
      map[serializer.typeInfoKey] = typeInfo;
    }
    map['title'] = value.title;
    map['content'] = value.content;
    map['link'] = value.link;
    map['authors'] = value.authors;
    map['published'] = serializer?.toPrimaryObject(value.published,
        useTypeInfo: useTypeInfo, withTypeInfo: false);
    map['updated'] = serializer?.toPrimaryObject(value.updated,
        useTypeInfo: useTypeInfo, withTypeInfo: false);
    return cleanNullInMap(map);
  }

  @override
  String get typeInfo => 'NewsDartlangPost';
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PubPost
// **************************************************************************

class PubPostCodec extends TypeCodec<PubPost> {
  @override
  PubPost decode(dynamic value, {Serializer serializer}) {
    PubPost obj = new PubPost();
    obj.title = (value['title'] ?? obj.title) as String;
    obj.content = (value['content'] ?? obj.content) as String;
    obj.link = (value['link'] ?? obj.link) as String;
    obj.authors = (serializer?.decode(value['authors'], type: String) ??
        obj.authors) as List<String>;
    obj.published = (serializer?.decode(value['published'], type: DateTime) ??
        obj.published) as DateTime;
    obj.updated = (serializer?.decode(value['updated'], type: DateTime) ??
        obj.updated) as DateTime;
    return obj;
  }

  @override
  dynamic encode(PubPost value,
      {Serializer serializer, bool useTypeInfo, bool withTypeInfo}) {
    Map<String, dynamic> map = new Map<String, dynamic>();
    if (serializer.enableTypeInfo(useTypeInfo, withTypeInfo)) {
      map[serializer.typeInfoKey] = typeInfo;
    }
    map['title'] = value.title;
    map['content'] = value.content;
    map['link'] = value.link;
    map['authors'] = value.authors;
    map['published'] = serializer?.toPrimaryObject(value.published,
        useTypeInfo: useTypeInfo, withTypeInfo: false);
    map['updated'] = serializer?.toPrimaryObject(value.updated,
        useTypeInfo: useTypeInfo, withTypeInfo: false);
    return cleanNullInMap(map);
  }

  @override
  String get typeInfo => 'PubPost';
}

Map<String, TypeCodec<dynamic>> lib_models_post_codecs =
    <String, TypeCodec<dynamic>>{
  'DartAcademyPost': new DartAcademyPostCodec(),
  'StackoverflowPost': new StackoverflowPostCodec(),
  'NewsDartlangPost': new NewsDartlangPostCodec(),
  'PubPost': new PubPostCodec(),
};
