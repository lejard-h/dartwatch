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
  Post _last;
  BrowserClient _http = new BrowserClient();
  final String api = "";
  Settings _settings;
  static const num pull_feed_limit = 10;

  List<Post> feed = [];

  List<Post> get filteredFeed =>
      feed.where((Post p) => _inFilter(_settings.stackOverflow, _settings.dartlang, _settings.dartAcademy, p)).toList();

  Future<List<Post>> fetchPost({int limit: pull_feed_limit, Post lastPost}) async {
    Map<String, String> query = {
      "limit": limit.toString(),
    } /*..addAll(_settings?.toMapString() ?? {})*/;
    ;
    if (lastPost != null) {
      query["to"] = lastPost.published.toIso8601String();
    }
    String url = "$api/posts?${mapToQuery(query, encoding: UTF8)}";
    Response res = await _http.get(url);
    if (res.statusCode == 200) {
      return serializer.decode(res.body, useTypeInfo: true);
    }

    return [];
  }

  Future<List<Post>> fetchLastPosts({int limit: pull_feed_limit}) async {
    Map<String, String> query = {
      "limit": limit.toString(),
    };

    String url = "$api/posts/last?${mapToQuery(query, encoding: UTF8)}";
    Response res = await _http.get(url);
    if (res.statusCode == 200) {
      return serializer.decode(res.body, useTypeInfo: true);
    }

    return [];
  }

  Future<List<Post>> fetchNext({int limit: pull_feed_limit}) async {
    if (feed.isNotEmpty) {
      _last ??= feed.last;
    }
    List<Post> p = await fetchPost(lastPost: _last, limit: pull_feed_limit);
    if (p.isNotEmpty == true) {
      _last = p.last;
      feed.addAll(p);
    }

    return p;
  }

  bool _inFilter(bool so, bool dl, bool da, Post post) =>
      (post is StackoverflowPost && so != false) ||
      (post is DartAcademyPost && da != false) ||
      (post is NewsDartlangPost && dl != false);

  FeedService(this._settings);
}
