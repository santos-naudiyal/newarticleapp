


import 'package:flutter/material.dart';
import 'package:newsapp/helper/categorydata.dart';
import 'package:newsapp/helper/newsdata.dart';
import 'package:newsapp/model/categorymodel.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/views/categoryTile.dart';
import 'package:newsapp/views/newstemplate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // Get our categories list
  List<CategoryModel> categories = [];

  // Get our news list first
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    
    News newsdata = News();
    await newsdata.getNews();
    setState(() {
      _loading = false;
      articles = newsdata.datatobesavedin;
    });
  }

  Future<void> _refreshNews() async {
    setState(() {
      _loading = true;
    });
    await getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      appBar: AppBar(
        
        
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter ",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "NewsApp",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: _refreshNews,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 70.0,
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          itemCount: articles.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return NewsTemplate(
                              urlToImage: articles[index].urlToImage,
                              title: articles[index].title,
                              description: articles[index].description,
                              url: articles[index].url,
                              article: articles[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}







