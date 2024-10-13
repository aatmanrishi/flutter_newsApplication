import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_news_app/Pages/EveryDayPage.dart';
import 'package:your_news_app/apiServices/apiServices.dart';

class customAppBar extends StatefulWidget {
  const customAppBar({super.key});

  @override
  State<customAppBar> createState() => _customAppBarState();
}

class _customAppBarState extends State<customAppBar> {
  final newsController = Get.find<ApiServices>();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.black,
          title: Text('Trending News',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(Everydaypage());
              },
              child: Text('Everyday News',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 2)),
            ),
            SizedBox(width: 10)
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                // Wrap the TextField in an Expanded widget
                child: Container(
                  height: 50,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search...',
                    ),
                  ),
                ),
              ),
              Container(
                height: 50, // Ensure the container has the same height
                decoration: BoxDecoration(
                  color: Colors
                      .orangeAccent, // Change the color to match the TextField
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                child: IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
                  onPressed: () {
                    // Add your search action here
                    if (_controller.text.isEmpty) {
                      Get.snackbar(
                        borderColor: Colors.white,
                        borderWidth: 0.8,
                        backgroundColor: const Color.fromARGB(255, 5, 0, 23),
                        colorText: Colors.white,
                        'No value found',
                        'Please Enter Some Value');
                    }else{
                      newsController.searchNews(
                        _controller.text.toString(), 'topHeadline');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
