import 'dart:convert';

import 'package:flutter_movie/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {

  Future<List<Movie>> fetchMovies() async {
    // await: Future가 종료되는 것을 기다린다, async 키워드가 붙어있는 메서드 안에서만 사용 가능
    final http.Response response =
    await http.get('https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1');

    // 200 OK
    if (response.statusCode == 200) {
      final Iterable json = jsonDecode(response.body)['results'];
      return json.map((e) => Movie.fromJson(e)).toList();
    } else {
      // 에러가 나면 예외를 발생시키고 종료
      throw Exception('Failed to load album');
    }
  }
}