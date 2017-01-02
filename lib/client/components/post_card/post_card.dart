import 'dart:html';
import 'package:angular2/core.dart';
import 'package:dartwatch/models/post.dart';

@Component(
    selector: 'post-card',
    templateUrl: 'post_card.html',
    styleUrls: const <String>['post_card.css'],
    host: const {"class": "card card-1"})
class PostCard implements OnInit {
  @ViewChild("content")
  ElementRef contentRef;

  @Input()
  Post post;

  String get author => post?.authors?.isNotEmpty == true ? post.authors.first : "";

  bool get isStackOverflow => post is StackoverflowPost;
  bool get isNewsDartlang => post is NewsDartlangPost;
  bool get isDartAcademy => post is DartAcademyPost;

  @override
  ngOnInit() {
    if (post?.content?.isNotEmpty == true) {
      (contentRef.nativeElement as DivElement).appendHtml(post.content, treeSanitizer: NodeTreeSanitizer.trusted);
    }
  }
}
