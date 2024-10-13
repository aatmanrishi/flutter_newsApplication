import 'dart:convert';

import 'package:get/get.dart';
import 'package:your_news_app/Model/NewsModel.dart';
import 'package:your_news_app/Pages/SearchPage.dart';
import './everyDayNewsController.dart';
import './controller.dart';
import 'package:http/http.dart' as http;

class ApiServices extends GetxController {
  var topHeadlinesNewsArticle = <Articles>[].obs;
  var topHeadlinesNewsArticleByCategory = <Articles>[].obs;
  var topHeadlineCategoryIndex = 0.obs;
  RxBool loader = false.obs;
  // EveryDayNews variables
  var EveryDayNewsArticles = <Articles>[].obs;
  var everydaynNewsIndex = 0.obs;

  // SearchedNewsArticles
  var SearchedNewsArticles = <Articles>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTopHeadlinesNews();
    // Fetch by category only when the index is set or changed
    getTopHeadlinesNewsByCategory();
    // EveryDay News
    loadEveryDayNews();
  }

  Future<void> getTopHeadlinesNews() async {
    loader.value = true; // Set loader to true
    try {
      var articles = await fetchTopHeadlines(); // Use the imported function
      topHeadlinesNewsArticle.clear();
      topHeadlinesNewsArticle.addAll(articles);
    } catch (e) {
      print(e); // Handle any errors
    } finally {
      loader.value = false; // Ensure loader is set to false after try/catch
    }
  }

  // Fetch news for top headlines by category
  Future<void> getTopHeadlinesNewsByCategory() async {
    loader.value = true; // Set loader to true
    try {
      var articles = await fetchTopHeadlinesbyCategory(
          topHeadlineCategoryIndex); // Pass the current index
      topHeadlinesNewsArticleByCategory.clear();
      topHeadlinesNewsArticleByCategory.addAll(articles);
      print(topHeadlinesNewsArticleByCategory.length);
    } catch (e) {
      print(e); // Handle any errors
    } finally {
      loader.value = false; // Ensure loader is set to false after try/catch
    }
  }

  // Method to manually trigger fetching news by category
  Future<void> fetchNewsByCategory(int index) async {
    topHeadlineCategoryIndex.value = index; // Update the category index
    await getTopHeadlinesNewsByCategory(); // Call the method to fetch articles
  }

  Future<void> loadEveryDayNews() async {
    loader.value = true;
    try {
      var articles = await fetchEveryDayNews(everydaynNewsIndex);
      EveryDayNewsArticles.clear();
      EveryDayNewsArticles.addAll(articles);
    } catch (e) {
      print(e);
    } finally {
      loader.value = false;
    }
  }
// Search Function

  Future<void> searchNews(String value, String fromPage) async {
    Get.to(SearchPage());
    String apiKey =
        'f933955adcab477383fa51f38c9be6c1'; // Keep API key in one place
    String url;

    if (fromPage == 'topHeadline') {
      url = 'https://newsapi.org/v2/top-headlines?q=$value&apiKey=$apiKey';
    } else {
      url = 'https://newsapi.org/v2/everything?q=$value&apiKey=$apiKey';
    }

    try {
      var response = await http.get(Uri.parse(url));

      // Check for successful response
      if (response.statusCode == 200) {
        var newsData = NewsArticle.fromJson(jsonDecode(response.body));
        SearchedNewsArticles.clear();
        SearchedNewsArticles.addAll(newsData.articles);
      } else {
        // Handle error response
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e'); // Print error for debugging
      // Return an empty list in case of error
    }
  }
}
