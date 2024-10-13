import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_news_app/apiServices/apiServices.dart';

class EveryDayNewsCustomTabBar extends StatefulWidget {
  const EveryDayNewsCustomTabBar({super.key});

  @override
  State<EveryDayNewsCustomTabBar> createState() =>
      _EveryDayNewsCustomTabBarState();
}

class _EveryDayNewsCustomTabBarState extends State<EveryDayNewsCustomTabBar> {
  final newsController = Get.find<ApiServices>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
      margin: EdgeInsets.fromLTRB(0, 20, 10, 30),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Obx(() {
              return GestureDetector(
                onTap: () {
                  newsController.everydaynNewsIndex.value = 0;
                  newsController.loadEveryDayNews();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.everydaynNewsIndex.value == 0
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('General',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              );
            }),
            Obx(() {
              return GestureDetector(
                onTap: () {
                  newsController.everydaynNewsIndex.value = 1;
                  newsController.loadEveryDayNews();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.everydaynNewsIndex.value == 1
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Bitcoin',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              );
            }),
            Obx(() {
              return GestureDetector(
                onTap: () {
                  newsController.everydaynNewsIndex.value = 2;
                  newsController.loadEveryDayNews();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.everydaynNewsIndex.value == 2
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Apple',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              );
            }),
            Obx(() {
              return GestureDetector(
                onTap: () {
                  newsController.everydaynNewsIndex.value = 3;
                  newsController.loadEveryDayNews();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.everydaynNewsIndex.value == 3
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Games',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              );
            }),
            Obx(() {
              return GestureDetector(
                onTap: () {
                  newsController.everydaynNewsIndex.value = 4;
                  newsController.loadEveryDayNews();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.everydaynNewsIndex.value == 4
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Entertainment',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              );
            }),
            Obx(() {
              return GestureDetector(
                onTap: () {
                  newsController.everydaynNewsIndex.value = 5;
                  newsController.loadEveryDayNews();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.everydaynNewsIndex.value == 5
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Science',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              );
            }),
            Obx(() {
              return GestureDetector(
                onTap: () {
                  newsController.everydaynNewsIndex.value = 6;
                  newsController.loadEveryDayNews();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.everydaynNewsIndex.value == 6
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Health',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              );
            }),
            Obx(() {
              return GestureDetector(
                onTap: () {
                  newsController.everydaynNewsIndex.value = 7;
                  newsController.loadEveryDayNews();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      color: newsController.everydaynNewsIndex.value == 7
                          ? const Color.fromARGB(255, 255, 115, 0)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Technology',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
