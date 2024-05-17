/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsTemplate extends StatelessWidget {

String title, description, url, urlToImage;
 NewsTemplate({required this.title, required this.description, required this.url, required this.urlToImage});

 


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(imageUrl:urlToImage, width: 380, height: 200, fit: BoxFit.cover,)),
            SizedBox(height: 8),

            Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),),
             SizedBox(height: 8),

            Text(description,style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),),
      
        ],
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/views/article_detail.dart';

class NewsTemplate extends StatelessWidget {
  final String? urlToImage;
  final String title;
  final String description;
  final String url;
  final ArticleModel article;

  const NewsTemplate({
    super.key,
    required this.urlToImage,
    required this.title,
    required this.description,
    required this.url,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetail(article: article),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (urlToImage != null)
              Image.network(urlToImage!),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              description,
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
