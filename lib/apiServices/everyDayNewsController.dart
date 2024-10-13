// api_functions.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_news_app/Model/NewsModel.dart';
import 'package:get/get.dart';


Future<List<Articles>> fetchEveryDayNews(RxInt index) async {
  List<String> categoryArray = [
    'general',
    'bitcoin',
    'apple',
    'games',
    'business',
    'entertainment',
    'science',
    'health',
    'technology'
  ];
  var url =
      'https://newsapi.org/v2/everything?q=${categoryArray[index.value]}&apiKey=f933955adcab477383fa51f38c9be6c1';
  var response = await http.get(Uri.parse(url));

  if (index == 0) {
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var newsData = NewsArticle.fromJson(body);
      List<Articles> categoriezedEveryDayNewsArticles = newsData.articles;
      return categoriezedEveryDayNewsArticles; // Return the list of articles
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  } else {
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var newsData = NewsArticle.fromJson(body);
      print(newsData.articles);
      List<Articles> categoriezedEveryDayNewsArticles = newsData.articles;
      return categoriezedEveryDayNewsArticles; // Return the list of articles
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }
}
