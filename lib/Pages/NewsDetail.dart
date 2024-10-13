import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetail extends StatelessWidget {
  final String Title;
  final String Description;
  final String Content;
  final String authorname;
  final String source;
  final String published;
  final String urlToImage;

  const NewsDetail({
    super.key,
    required this.Title,
    required this.Description,
    required this.Content,
    required this.authorname,
    required this.source,
    required this.published,
    required this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 0, 23),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(urlToImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  Title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  softWrap: true, // Allow wrapping
                ),
                SizedBox(height: 10),
                Text(
                  Description,
                  style: TextStyle(fontSize: 19, color: Colors.white),
                  softWrap: true, // Allow wrapping
                ),
                SizedBox(height: 30),
                Text(
                  Content,
                  style: TextStyle(color: Colors.white),
                  softWrap: true, // Allow wrapping
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Author: $authorname',
                        style: TextStyle(color: Colors.white),
                        softWrap: true, // Allow wrapping
                      ),
                      Text(
                        'Published At: $published',
                        style: TextStyle(color: Colors.white),
                        softWrap: true, // Allow wrapping
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Source: $source',
                  style: TextStyle(color: Colors.white),
                  softWrap: true, // Allow wrapping
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
