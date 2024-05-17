import 'package:flutter/material.dart';
import 'views/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),

    },
  ));
}

