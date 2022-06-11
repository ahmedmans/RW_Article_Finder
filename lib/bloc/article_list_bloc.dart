import 'dart:async';

import 'package:article_finder/bloc/bloc.dart';
import 'package:article_finder/data/article.dart';
import 'package:article_finder/data/rw_client.dart';
import 'package:rxdart/rxdart.dart';

class ArticleListBloc implements Bloc {
  final _client = RWClient();

  final _searchQueryController = StreamController<String?>();

  Sink<String?> get searchQuery => _searchQueryController.sink;

  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {
    articlesStream = _searchQueryController.stream
        .startWith(null)
        .debounceTime(const Duration(milliseconds: 100))
        .switchMap(
            (query) => _client.fetchArticles(query).asStream().startWith(null));
  }

  @override
  void dispose() {
    _searchQueryController.close();
  }
}
