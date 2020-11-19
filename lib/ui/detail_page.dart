import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  DetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
      ),
      body: Column(
        children: [
          Text(movie.name),
          Hero(
            tag: movie,
            child: Image.network(movie.imageUrl),
          )
        ],
      ),
    );
  }
}
