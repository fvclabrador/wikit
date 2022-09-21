import 'package:flutter/foundation.dart';

/// A placeholder class that represents an entity or model.
class WikitCategory {
  final String category;

  const WikitCategory({required this.category});

  static WikitCategory fromJson(json) => WikitCategory(
        category: json['category'],
      );
}

const allCategories = [
  WikitCategory(category: 'General'),
  WikitCategory(category: 'General2'),
];

const allCategories2 = [
  {
    "category": "General",
  },
  {
    "category": "General2",
  },
];
