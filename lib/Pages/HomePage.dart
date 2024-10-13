import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_news_app/Components/CustomTabBar.dart';
import 'package:your_news_app/Components/customAppBar.dart';
import 'package:your_news_app/Components/newsBanner.dart';
import 'package:your_news_app/Components/newsCard.dart';
import 'package:your_news_app/apiServices/apiServices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final newsController = Get.find<ApiServices>();

  @override
  void initState() {
    super.initState();
    // Fetch the top headlines when the widget initializes
    newsController.getTopHeadlinesNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 0, 23),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Container(
          color: Colors.black,
          child: customAppBar(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // NewsBanner
            Container(
              height: 200, // Set a height for the horizontal scroll area
              child: Obx(() {
                if (newsController.loader.value == true) {
                  return Expanded(
                      child: Image.asset('assets/image/loader.gif'));
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          newsController.topHeadlinesNewsArticle.map((article) {
                        return NewsBanner(
                          newsImageUrl: article.urlToImage, // Handle null case
                          newsTitle: article.title, // Handle null case
                        ); // Pass the article to NewsBanner
                      }).toList(),
                    ),
                  );
                }
              }),
            ),
            // CustomTabBar
            CustomTabBar(),
            // NewsCards corresponding to CustomTabBar
            Obx(() {
              if (newsController.loader == true) {
                return Center(
                  child: Image.asset(
                      'assets/image/loader.gif'), // Ensure path is correct
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: newsController.topHeadlinesNewsArticleByCategory
                        .map((article) {
                      return NewsCard(
                        title: article.title, // Handle null case
                        urlToImage: article.urlToImage, // Handle null case
                        author: article.author, // Handle null case
                        description: article.description, // Handle null case
                        content: article.content, // Handle null case
                        publishedAt: article.publishedAt, // Handle null case
                        source:
                            article.source.name, // Safely access source name
                      );
                    }).toList(),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
