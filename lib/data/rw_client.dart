import 'package:article_finder/data/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class RWClient {
  final _host = 'api.raywenderlich.com';
  final _contextRoot = 'api';
  Future<List<Article>?> fetchArticles(String? query) async {
    Map<String, Object> params = {
      'filter[content_types][]': 'article',
      'page[size]': '25',
    };
    if (query != null && query.isNotEmpty) {
      params['filter[q]'] = query;
    }
    final results = await request(path: 'contents', parameters: params);
    return results['data']
        .map<Article>(Article.fromJson)
        .toList(growable: false);
  }

  Future<Article> getDetailArticle(String id) async {
    final results = await request(path: 'contents/$id', parameters: {});
    final data = results['data'];
    return Article.fromJson(data);
  }

  Future<Map> request({
    required String path,
    required Map<String, Object> parameters,
  }) async {
    final uri = Uri.https(_host, '$_contextRoot/$path', parameters);
    final headers = _headers;
    final results = await http.get(uri, headers: headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers => {
        'content-type': 'application/vnd.api+json; charset=utf-8',
        'Accept': 'application/json',
      };
}
