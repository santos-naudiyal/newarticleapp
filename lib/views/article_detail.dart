import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';

class ArticleDetail extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              Image.network(article.urlToImage!),
            SizedBox(height: 16.0),
            Text(
              article.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              article.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            //if (article.url != null)
             
          ],
        ),
      ),
    );
  }
}
