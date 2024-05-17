/*
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName, imageUrl;
  CategoryTile({required this.categoryName, required this.imageUrl})
  
  const CategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(imageUrl: imageUrl, width: 150, height: 80, fit: BoxFit.cover,),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/views/categorypage.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  // Combine the parameters into one constructor
  const CategoryTile({
    super.key,
    required this.categoryName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryFragment(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 170,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 170,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
