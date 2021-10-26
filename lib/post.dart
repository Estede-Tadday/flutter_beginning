import 'package:redditech/api/make_request.dart';
import 'dart:convert';

class Post extends Object {
  String subreddit;
  String text;
  String author;
  String title;
  String videoUrl;

  Post({
    required this.subreddit,
    required this.author,
    required this.title,
    required this.text,
    required this.videoUrl
  });
}

class AllPosts {
  final List<Post> allPosts;

  AllPosts({
    required this.allPosts
  });

  factory AllPosts.fromJson(Map<String, dynamic> json) {
    List<Post> all = <Post>[];
    String subreddit = '';
    String text = '';
    String author = '';
    String title = '';
    String videoUrl = '';

    List<dynamic> obj = json["data"]["children"];
    obj.forEach((element) {
      (element as Map<String, dynamic>).forEach((key, value) {
        if (key == 'data') {
          (value as Map<String, dynamic>).forEach((key2, value2) {
            if (key2 == 'author_fullname') { author = value2.toString(); }
            if (key2 == 'selftext') { text = value2.toString(); }
            if (key2 == 'title') { title = value2.toString(); }
            if (key2 == 'subreddit') { subreddit = value2.toString(); }
            if (key2 == 'is_video' && value2 == true) {
              videoUrl = value["media"]["reddit_video"]["fallback_url"].toString();
            }
            var post = Post(
              subreddit: subreddit,
              author: author,
              title: title,
              text: text,
              videoUrl: videoUrl,
            );
            all.add(post);
          });
        }
        author = '';
        text = '';
        title = '';
        subreddit = '';
        videoUrl = '';
      });
    });
    return AllPosts(
      allPosts: all,
    );
  }

}

Future<void> getAllPosts() async {
  var content = await makeGetRequest('https://oauth.reddit.com/hot');
  AllPosts A = AllPosts.fromJson(jsonDecode(content));
  A.allPosts.forEach((element) {
    if (element.videoUrl != '') {
      print(element.videoUrl);
    }
    if (element.subreddit != '') {
      print(element.subreddit);
    }
    if (element.author != '') {
      print(element.author);
    }
    if (element.title != '') {
      print(element.title);
    }
    if (element.text != '') {
      print(element.text);
    }
  });
}