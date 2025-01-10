import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:news_app/data/models/article.dart';

import '../../data/Api.dart';

/// Provides list of articles which are exposed via articles variable
class ArticlesProvider extends ChangeNotifier {
  final Api api;

  /// should be a private variable
  bool inProgress = false;

  /// should be a private variable
  Object? error = null;

  List<Article> _articles = [];

  UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);

  ArticlesProvider({required this.api}) {
    /// This could be called from the UI element
    getHeadlines();
  }

  void getHeadlines() async {
    try {
      inProgress = true;
      error = null;
      notifyListeners();
      _articles = await api.getArticles();
    } catch (e, str) {
      debugPrint("Errr $e, $str");
      error = e;
    } finally {
      inProgress = false;
      notifyListeners();
    }
  }
}
