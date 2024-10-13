import 'package:flutter/material.dart';

class NewsBanner extends StatelessWidget {
  final String newsImageUrl;
  final String newsTitle;

  const NewsBanner({
    super.key,
    required this.newsImageUrl,
    required this.newsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 180,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(newsImageUrl),
          fit: BoxFit.cover, // Ensure the image covers the container
        ),
      ),
      child: Stack(
        children: [
          // Dark overlay
          Container(
            decoration: BoxDecoration(
              color: Colors.black
                  .withOpacity(0.5), // Adjust opacity for darker overlay
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Content on top of the overlay
          Positioned(
            bottom: 20,
            left: 5,
            child: Container(
              width: 270, // Adjust width to fit the text inside
              child: Text(
                newsTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2, // Set maximum lines
                overflow: TextOverflow.ellipsis, // Show ellipsis if overflow
              ),
            ),
          ),
        ],
      ),
    );
  }
}
