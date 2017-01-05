import 'dart:async';
import 'dart:convert';
import "package:angular2/core.dart";
import 'package:http/browser_client.dart';
import 'package:http/src/utils.dart';
import 'package:http/src/response.dart';
import 'package:dartwatch/models/post.dart';
import 'package:dartwatch/models/serializer.dart';
import 'package:dartwatch/client/services.dart';

@Injectable()
class FeedService {
  BrowserClient _http = new BrowserClient();
  final String api = "";
  Settings _settings;

  List<Post> feed = [];

  Future<List<Post>> fetchPost({int limit: 10, Post lastPost}) async {
    Map<String, String> query = {
      "limit": limit.toString(),
    };
    if (lastPost != null) {
      query["to"] = lastPost.published.toIso8601String();
    }
    String url = "$api/list-posts?${mapToQuery(query, encoding: UTF8)}";
    Response res = await _http.get(url);
    if (res.statusCode == 200) {
      return serializer.decode(res.body, useTypeInfo: true);
    }

    return [];
  }

  Post last;

  Future<List<Post>> fetchNext() async {
    last ??= feed.last;
    List<Post> p = await fetchPost(lastPost: last, limit: 10);
    if (p.isNotEmpty == true) {
      last = p.last;
      feed.addAll(p);
    }

    return p;
  }

  FeedService(this._settings);
}
