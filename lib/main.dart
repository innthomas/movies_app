import 'package:flutter/material.dart';
import 'package:movies_app/movie_list.dart';

void main() {
  runApp(MyMovies());
}

class MyMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my movies',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MovieList();
  }
}
