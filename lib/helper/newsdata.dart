import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/newsmodel.dart';

class News {
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews() async {
    try {
      var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=8fb192584fa04ecc9676dc489a6aedb7'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['status'] == 'ok') {
          jsonData['articles'].forEach((element) {
            if (element['urlToImage'] != null && element['description'] != null) {
              ArticleModel articleModel = ArticleModel(
                title: element['title'],
                urlToImage: element['urlToImage'],
                description: element['description'],
                url: element['url'],
              );

              datatobesavedin.add(articleModel);
            }
          });
        }
      } else {
        print('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

class CategoryNews {
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews(String category) async {
    try {
      var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=8fb192584fa04ecc9676dc489a6aedb7'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['status'] == 'ok') {
          jsonData['articles'].forEach((element) {
            if (element['urlToImage'] != null && element['description'] != null) {
              ArticleModel articleModel = ArticleModel(
                title: element['title'],
                urlToImage: element['urlToImage'],
                description: element['description'],
                url: element['url'],
              );

              datatobesavedin.add(articleModel);
            }
          });
        }
      } else {
        print('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}



