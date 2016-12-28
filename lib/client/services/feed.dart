import 'dart:async';
import 'dart:convert';
import "package:angular2/core.dart";
import 'package:http/browser_client.dart';
import 'package:http/src/utils.dart';
import 'package:http/src/response.dart';
import 'package:darty/models/post.dart';
import 'package:darty/models/serializer.dart';
import 'package:darty/components.dart';

@Injectable()
class FeedService {
  BrowserClient _http = new BrowserClient();
  final String api = "http://localhost:8080";

  List<Post> feed = [];

  Future<List<Post>> fetchPost({int limit: 15, Post lastPost, Settings settings}) async {
    Map<String, String> query = {
      "limit": limit.toString(),
    }..addAll(settings?.toMapString() ?? {});
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
    List<Post> p = await fetchPost(lastPost: last, limit: 5);
    if (p.isNotEmpty == true) {
      last = p.last;
      feed.addAll(p);
    }

    return p;
  }

  FeedService();
}
