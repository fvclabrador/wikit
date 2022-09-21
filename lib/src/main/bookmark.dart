import 'package:flutter/foundation.dart';

/// A placeholder class that represents an entity or model.
class Bookmark {
  final String title;
  final String url;

  const Bookmark({required this.title, required this.url});

  static Bookmark fromJson(json) => Bookmark(
        title: json['title'],
        url: json['url'],
      );
}

const bookmarkData = [
  {
    "aws serverless":
        "https://www.serverless.com/framework/docs/getting-started",
  },
];
