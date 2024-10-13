import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import the intl package
import '../Pages/NewsDetail.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String? urlToImage;
  final String author;
  final String description;
  final String content;
  final String publishedAt;
  final String source;

  const NewsCard({
    super.key,
    required this.title,
    this.urlToImage,
    required this.author,
    required this.description,
    required this.content,
    required this.publishedAt,
    required this.source,
  });

  String formatPublishedAt(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('yyyy-MM-dd')
          .format(parsedDate); // Format to 'yyyy-MM-dd'
    } catch (e) {
      return 'Unknown Date'; // Fallback in case of an error
    }
  }

  String trimAuthor(String author, {int maxLength = 20}) {
    if (author.length > maxLength) {
      return '${author.substring(0, maxLength)}...';
    }
    return author;
  }

  @override
  Widget build(BuildContext context) {
    print('Here is our card');
    return GestureDetector(
      onTap: () {
        Get.to(() => NewsDetail(Title: title,urlToImage: urlToImage.toString(),Description:description, Content : content,authorname: author,published: publishedAt,source: source,));
      },
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 2, 1, 34),
          border: Border.all(color: Colors.white, width: 0.25),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(urlToImage ??
                      'https://i.ytimg.com/vi/KUSmnHpcEnQ/maxresdefault.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 170,
              width: MediaQuery.of(context).size.width * 0.95,
            ),
            SizedBox(height: 30),
            Text(
              title.isNotEmpty ? title : 'Title Not Found',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trimAuthor(author.isNotEmpty
                      ? author
                      : 'Unknown Author'), // Trim the author's name
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                Text(
                  formatPublishedAt(publishedAt), // Format the published date
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              source.isNotEmpty ? source : 'Unknown Source',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
