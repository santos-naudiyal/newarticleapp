import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/helper/categorydata.dart';
import 'package:newsapp/helper/newsdata.dart';
import 'package:newsapp/model/categorymodel.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/views/article_detail.dart';
import 'package:newsapp/views/categoryTile.dart';
import 'package:newsapp/views/newstemplate.dart';

class CategoryFragment extends StatefulWidget {
  String category;
  CategoryFragment({required this.category});
  //const CategoryFragment({super.key});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  getNews() async {
    CategoryNews newsdata = CategoryNews();
    await newsdata.getNews(widget.category);
    setState(() {
      _loading = false;
      articles = newsdata.datatobesavedin;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
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
          backgroundColor: Colors.blue[800],
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  widget.category.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),

      // Category Widgets



      


      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            ): 
            RefreshIndicator( onRefresh: _refreshNews,
            child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                    child: ListView.builder(
                    itemCount: articles.length,
                    physics: ClampingScrollPhysics(),
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
                      ),
                  )),
            ),
    );
  }
}






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

