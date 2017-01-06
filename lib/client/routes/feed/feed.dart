import 'dart:html';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:dartwatch/client/components.dart';
import 'package:dartwatch/client/services.dart';
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
  Post current;
  List<Post> get feed => _feedService.filteredFeed;

  @ViewChild("list")
  ElementRef refList;

  Main(this._feedService);

  @override
  ngOnInit() async {
    _feedService.feed = await _feedService.fetchLastPosts();
    refList.nativeElement.onScroll.listen((Event e) {
      if (feed?.isNotEmpty == true && _fetching == false) {
        if ((refList.nativeElement as DivElement).scrollTop +
                (refList.nativeElement as DivElement).offsetHeight +
                100 >=
            (refList.nativeElement as DivElement).scrollHeight) {
          _fetching = true;
          _feedService.fetchNext().then((_) {
            _fetching = false;
          });
        }
      }
    });
  }
}
