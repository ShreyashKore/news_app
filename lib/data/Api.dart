import 'package:dio/dio.dart';
import 'package:news_app/data/models/article.dart';

const baseUrl = "https://newsapi.org/v2/";

const apiKey = "761a6676d32340669f01fa93c8c777b4";

class Api {
  final Dio dio;
 
  Api({required this.dio});

  Future<List<Article>> getArticles({String country = "us"}) async {
    final response = await dio.get<Map<String, dynamic>>(
        "${baseUrl}top-headlines",
        queryParameters: {"country": country, "apiKey": apiKey});
    final articlesJson = response.data?["articles"] as List;
    return articlesJson.map((json) => Article.fromJson(json)).toList();
  }
}
