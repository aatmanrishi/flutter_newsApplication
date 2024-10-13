import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_news_app/Components/EveryDayNewsCustomTabBar.dart';
import 'package:your_news_app/Components/EveryDayNewsSearchBar.dart';
import 'package:your_news_app/apiServices/apiServices.dart';

import '../Components/newsCard.dart';

class Everydaypage extends StatefulWidget {
  const Everydaypage({super.key});

  @override
  State<Everydaypage> createState() => _EverydaypageState();
}

class _EverydaypageState extends State<Everydaypage> {
  final newsController = Get.find<ApiServices>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 0, 23),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.black,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                title: Text(
                  'Everyday News',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Everydaynewssearchbar()
            ],
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
          width: Get.width,
          padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EveryDayNewsCustomTabBar(),
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
                      children:
                          newsController.EveryDayNewsArticles.map((article) {
                        return NewsCard(
                          title: article.title, // Handle null case
                          urlToImage: article.urlToImage ??
                              'https://cdn.dribbble.com/users/101577/screenshots/4871767/hello-3-3.gif', // Handle null case
                          author:
                              article.author ?? 'Unknown', // Handle null case
                          description:
                              article.description ?? '', // Handle null case
                          content: article.content, // Handle null case
                          publishedAt: article.publishedAt, // Handle null case
                          source: article.source.name ??
                              'Unknown', // Safely access source name
                        );
                      }).toList(),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
