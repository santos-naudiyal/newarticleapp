import 'package:flutter/material.dart';
import 'package:newsapp/splash_screen.dart';
import 'views/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

   home: SplashScreen(),
    routes: {
      '/HomePage': (context) => HomePage(), // Define HomePage widget
    },
  ),
  
  
  );
}

