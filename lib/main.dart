import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_news_app/Pages/HomePage.dart';
import 'package:your_news_app/apiServices/apiServices.dart';

void main() {
   Get.put(ApiServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

