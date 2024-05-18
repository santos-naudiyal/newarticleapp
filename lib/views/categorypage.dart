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
  final String urlToImage, title, url;
  final ArticleModel article;

  const NewsTemplate({
    Key? key,
    required this.urlToImage,
    required this.title,
    required this.url,
    required this.article, required String description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
         onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetail(article: article),
          ),
        );
      },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                urlToImage,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


