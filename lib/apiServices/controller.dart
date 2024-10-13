// api_functions.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_news_app/Model/NewsModel.dart';
import 'package:get/get.dart';

Future<List<Articles>> fetchTopHeadlines() async {
  var url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=f933955adcab477383fa51f38c9be6c1';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    var newsData = NewsArticle.fromJson(body);
    return newsData.articles; // Return the list of articles
  } else {
    throw Exception('Failed to load news: ${response.statusCode}');
  }
}

Future<List<Articles>> fetchTopHeadlinesbyCategory(RxInt index) async {
  List<String> categoryArray = [
    'general',
    'business',
    'entertainment',
    'science',
    'health',
    'technology'
  ];
  var url =
      'https://newsapi.org/v2/top-headlines?country=us&category=${categoryArray[index.value]}&apiKey=f933955adcab477383fa51f38c9be6c1';
  var response = await http.get(Uri.parse(url));

  if (index == 0) {
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var newsData = NewsArticle.fromJson(body);
      List<Articles> categoriezedNewsArticles = newsData.articles;
      return categoriezedNewsArticles; // Return the list of articles
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  } else {
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var newsData = NewsArticle.fromJson(body);
      print(newsData.articles);
      List<Articles> categoriezedNewsArticles = newsData.articles;
      return categoriezedNewsArticles; // Return the list of articles
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }
}
