import 'package:flutter/material.dart';
import 'views/homepage.dart';

void main() {
  runApp(MaterialApp(

    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),

    },
  ));
}

