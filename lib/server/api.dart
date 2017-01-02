library api;

import 'dart:async';
import 'dart:io';

import 'package:jaguar/jaguar.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart' as http_response;
import 'package:xml/xml.dart';
import 'package:dart_feed/dart_feed.dart';
import 'package:dartwatch/models/post.dart' as model;
import 'package:dartwatch/models/serializer.dart';

part 'api.g.dart';

typedef model.Post EntryParser(XmlElement entry);

typedef model.Post ItemParser(Item item);

@Api()
class DartWatchApi extends _$JaguarDartWatchApi {
  static const int _refreshMinutes = 5;

  List<model.PubPost> _pubPosts = [];
  List<model.StackoverflowPost> _stackoverflowPosts = [];
  List<model.NewsDartlangPost> _newsPosts = [];
  List<model.DartAcademyPost> _dartAcademy = [];

  DartWatchApi() {
    _refresh();
    new Timer.periodic(const Duration(minutes: _refreshMinutes), (Timer _) {
      _refresh();
    });
  }

  _refresh() async {
    _fetchPub().then((List<model.Post> p) {
      _pubPosts = p;
    });
    _fetchStackoverflow().then((List<model.Post> p) {
      _stackoverflowPosts = p;
    });
    _fetchNews().then((List<model.Post> p) {
      _newsPosts = p;
    });
    _fetchDartAcademy().then((List<model.Post> p) {
      _dartAcademy = p;
    });
  }

  Future<List<model.Post>> _fetchRssFeed(String url, ItemParser parser) async {
    http_response.Response res = await http.get(url);
    if (res.statusCode == 200) {
      Feed feed = await Feed.fromString(res.body);
      return feed.items.map(parser).toList();
    }
    return [];
  }

  Future<List<model.Post>> _fetchAtomFeed(String url, EntryParser parser) async {
    http_response.Response res = await http.get(url);
    if (res.statusCode == 200) {
      XmlDocument doc = parse(res.body);
      return doc.findAllElements("entry").map(parser).toList();
    }
    return [];
  }

  Future<List<model.DartAcademyPost>> _fetchDartAcademy() async => _fetchRssFeed(model.dart_academy, (Item item) {
        return new model.DartAcademyPost.fromItem(item);
      }) as Future<List<model.DartAcademyPost>>;

  Future<List<model.PubPost>> _fetchPub() async => _fetchAtomFeed(model.pub_dartlang, (XmlElement entry) {
        return new model.PubPost.fromXml(entry);
      }) as Future<List<model.PubPost>>;

  Future<List<model.StackoverflowPost>> _fetchStackoverflow() async =>
      _fetchAtomFeed(model.stackoverflow_dart, (XmlElement entry) {
        return new model.StackoverflowPost.fromXml(entry);
      }) as Future<List<model.StackoverflowPost>>;

  Future<List<model.NewsDartlangPost>> _fetchNews() async => _fetchAtomFeed(model.news_dartlang, (XmlElement entry) {
        return new model.NewsDartlangPost.fromXml(entry);
      }) as Future<List<model.NewsDartlangPost>>;

  @Route('/list-posts', methods: const ["GET"], headers: const {"Access-Control-Allow-Origin": "*"})
  String listPosts({int limit: 10, String from, String to, int sort: -1, bool so: true, bool dl: true, bool da: true}) {
    DateTime fromDate = from != null ? DateTime.parse(from) : null;
    DateTime toDate = to != null ? DateTime.parse(to) : null;
    List<model.Post> posts = []..addAll(_newsPosts)..addAll(_stackoverflowPosts)..addAll(_dartAcademy);
    posts =
        posts.where((model.Post p) => _inDateRange(p.published, fromDate, toDate) && _inFilter(so, dl, da, p)).toList();
    posts.sort((model.Post a, model.Post b) {
      return sort * _sortPosts(a, b);
    });
    if (limit > posts.length) {
      limit = posts.length;
    }
    posts = posts.getRange(0, limit).toList();
    return serializer.encode(posts);
  }

  bool _inFilter(bool so, bool dl, bool da, model.Post post) =>
      (post is model.StackoverflowPost && so != false) ||
      (post is model.DartAcademyPost && da != false) ||
      (post is model.NewsDartlangPost && dl != false);

  bool _inDateRange(DateTime date, DateTime from, DateTime to) {
    if (from != null && to == null) {
      return date.millisecondsSinceEpoch >= from.millisecondsSinceEpoch;
    } else if (from == null && to != null) {
      return date.millisecondsSinceEpoch < to.millisecondsSinceEpoch;
    } else if (from != null && to != null) {
      return date.millisecondsSinceEpoch >= from.millisecondsSinceEpoch &&
          date.millisecondsSinceEpoch < to.millisecondsSinceEpoch;
    }
    return true;
  }

  @Route('/list-pub', methods: const ["GET"], headers: const {"Access-Control-Allow-Origin": "*"})
  String listPub() {
    List<model.Post> posts = _pubPosts;
    posts.sort(_sortPosts);
    return serializer.encode(posts);
  }

  int _sortPosts(model.Post a, model.Post b) => a.published.millisecondsSinceEpoch - b.published.millisecondsSinceEpoch;
}
