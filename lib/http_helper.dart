import 'package:http/http.dart' as http;
import 'dart:io';
import 'movie.dart';
import 'dart:convert';

class HttpHelper {
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=a3a2a51659cd0a85f64b30eaf4d43155&query=';
  final String urlkey = 'api_key=a3a2a51659cd0a85f64b30eaf4d43155';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlkey + urlLanguage;
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List> findMovies(String title) async {
    final String query = urlSearchBase + title;
    http.Response result = await http.get(query);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
