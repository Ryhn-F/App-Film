import 'package:flutter/material.dart';
import 'package:netflix_app/Halaman/Dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:NetflixHomepage(),
      );
  }
}