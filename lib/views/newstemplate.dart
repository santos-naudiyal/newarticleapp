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