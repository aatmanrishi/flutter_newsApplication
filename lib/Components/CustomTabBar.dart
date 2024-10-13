import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_news_app/apiServices/apiServices.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final newsController = Get.find<ApiServices>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 5, 10),
      margin: EdgeInsets.fromLTRB(0, 20, 10, 30),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Obx(() {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.topHeadlineCategoryIndex == 0
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('General',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
                onTap: () {
                  newsController.topHeadlineCategoryIndex.value = 0;
                  newsController.fetchNewsByCategory(0);
                },
              );
            }),
            Obx(() {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.topHeadlineCategoryIndex == 1
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Bussiness',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
                onTap: () {
                  newsController.topHeadlineCategoryIndex.value = 1;
                  newsController.fetchNewsByCategory(1);
                },
              );
            }),
            Obx(() {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.topHeadlineCategoryIndex == 2
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Entertainment',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
                onTap: () {
                  newsController.topHeadlineCategoryIndex.value = 2;
                  newsController.fetchNewsByCategory(2);
                },
              );
            }),
            Obx(() {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.topHeadlineCategoryIndex == 3
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Science',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
                onTap: () {
                  newsController.topHeadlineCategoryIndex.value = 3;
                  newsController.fetchNewsByCategory(3);
                },
              );
            }),
            Obx(() {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.topHeadlineCategoryIndex == 4
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Health',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
                onTap: () {
                  newsController.topHeadlineCategoryIndex.value = 4;
                  newsController.fetchNewsByCategory(4);
                },
              );
            }),
            Obx(() {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.topHeadlineCategoryIndex == 5
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Technology',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
                onTap: () {
                  newsController.topHeadlineCategoryIndex.value = 5;
                  newsController.fetchNewsByCategory(5);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
