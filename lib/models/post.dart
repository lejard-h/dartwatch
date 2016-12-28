import 'package:xml/xml.dart';
import 'package:dart_feed/dart_feed.dart';
import 'serializer.dart';

//rss
const String dart_academy = "http://dart.academy/rss/";

//atom
const String news_dartlang = "http://news.dartlang.org/feeds/posts/default";
const String stackoverflow_dart = "http://stackoverflow.com/feeds/tag?tagnames=dart&sort=newest&tagnames=flutter";
const String pub_dartlang = "https://pub.dartlang.org/feed.atom";

const String soSettingsKey = "so";
const String dartlangSettingsKey = "dl";
const String dartAcademySettingsKey = "da";

@serializable
abstract class Post {
  String title;
  String content;
  String link;
  List<String> authors;
  DateTime published;
  DateTime updated;
}

@serializable
class DartAcademyPost extends Post {
  DartAcademyPost();

  DartAcademyPost.fromItem(Item item) {
    title = item.title;
    updated = item.pubDate.toUtc();
    published = item.pubDate.toUtc();
    content = item.description;
    link = item.link.toString();
    authors = [item.author];
  }
}

@serializable
class StackoverflowPost extends Post {
  String profileUrl;
  StackoverflowPost();

  StackoverflowPost.fromXml(XmlElement xml) {
    title = xml.findElements("title").first.text;
    updated = DateTime.parse(xml.findElements("updated").first.text);
    published = DateTime.parse(xml.findElements("published").first.text);
    content = xml.findElements("summary").first.text;
    link = xml
        .findElements("link")
        .first
        .attributes
        .firstWhere((XmlAttribute a) => a.name.toString() == "href", orElse: () => null)
        ?.value;
    authors = xml.findElements("author").first.findElements("name").map((XmlElement elem) => elem.text).toList();
    Iterable u = xml.findElements("author").first.findElements("uri");
    if (u?.isNotEmpty == true) {
      profileUrl = u.first.text;
    }
  }
}

@serializable
class NewsDartlangPost extends Post {
  NewsDartlangPost();

  NewsDartlangPost.fromXml(XmlElement xml) {
    title = xml.findElements("title").first.text;
    updated = DateTime.parse(xml.findElements("updated").first.text);
    published = DateTime.parse(xml.findElements("published").first.text);
    content = xml.findElements("content").first.text;
    link = xml
        .findElements("link")
        .first
        .attributes
        .firstWhere((XmlAttribute a) => a.name.toString() == "href", orElse: () => null)
        ?.value;
    authors = xml.findElements("author").first.findElements("name").map((XmlElement elem) => elem.text).toList();
  }
}

@serializable
class PubPost extends Post {
  PubPost();

  PubPost.fromXml(XmlElement xml) {
    title = xml.findElements("title").first.text;
    updated = DateTime.parse(xml.findElements("updated").first.text);
    if (xml.findElements("published")?.isNotEmpty == true) {
      published = DateTime.parse(xml.findElements("published").first.text);
    } else {
      published = updated;
    }
    content = xml.findElements("content").first.text;
    link = xml
        .findElements("link")
        .first
        .attributes
        .firstWhere((XmlAttribute a) => a.name.toString() == "href", orElse: () => null)
        ?.value;
    authors = xml.findElements("author").first.findElements("name").map((XmlElement elem) => elem.text).toList();
  }
}
