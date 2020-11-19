import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie.dart';
import 'package:flutter_movie/ui/detail_page.dart';
import 'package:flutter_movie/ui/movie_item.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final movieItems = [
    Movie('https://cphoto.asiae.co.kr/listimglink/6/2017071813023751011_1.jpg',
        '수지'),
    Movie(
        'https://img.huffingtonpost.com/asset/5caad7602400005d010443d8.jpeg?ops=scalefit_630_noupscale',
        '수지'),
    Movie('https://cphoto.asiae.co.kr/listimglink/6/2017071813023751011_1.jpg',
        '수지'),
    Movie('https://cphoto.asiae.co.kr/listimglink/6/2017071813023751011_1.jpg',
        '수지'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('영화 정보 검색기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: '검색'),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: 1 / 1.9,
                crossAxisSpacing: 4,
                crossAxisCount: 3,
                children: movieItems.map((movie) {
                  return InkWell(
                      child: MovieItem(movie),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage(movie)),
                        );
                      },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
