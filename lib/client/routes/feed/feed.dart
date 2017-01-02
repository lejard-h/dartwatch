import 'dart:html';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:dartwatch/services.dart';
import 'package:dartwatch/components.dart';
import 'package:dartwatch/models/post.dart';
import 'package:material2_dart/material.dart';

@Component(
    selector: 'feed',
    templateUrl: 'feed.html',
    styleUrls: const <String>['feed.css'],
    directives: const [PostCard, FeedSidenav, MD_SIDENAV_DIRECTIVES, MD_BUTTON_DIRECTIVES],
    providers: const [FeedService])
class Main implements OnInit {
  static const String route_name = "Feed";
  static const String route_path = "/";
  static const Route route =
      const Route(path: Main.route_path, component: Main, name: Main.route_name, useAsDefault: true);

  FeedService _feedService;
  bool _fetching = false;
  Settings settings = new Settings();

  Main(this._feedService);

  bool _inFilter(bool so, bool dl, bool da, Post post) =>
      (post is StackoverflowPost && so != false) ||
      (post is DartAcademyPost && da != false) ||
      (post is NewsDartlangPost && dl != false);

  List<Post> get feed => _feedService.feed
      .where((Post p) => _inFilter(settings.stackOverflow, settings.dartlang, settings.dartAcademy, p)).toList();

  Post current;

  void onExpand(Post p) {
    if (current == p) {
      current = null;
    } else {
      current = p;
    }
  }

  @override
  ngOnInit() async {
    _feedService.feed = await _feedService.fetchPost(limit: 50);
    window.onScroll.listen((Event e) {
      if (feed?.isNotEmpty == true && _fetching == false) {
        if (window.innerHeight + window.scrollY >= document.body.scrollHeight) {
          _fetching = true;
          _feedService.fetchNext().then((_) {
            _fetching = false;
          });
        }
      }
    });
  }
}
