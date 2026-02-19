import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/apikey/constants.dart';
import 'package:movieapp/models/movie.dart';

class Api {
  static const _trendingaUrl = "https://api.themoviedb.org/3/trending/movie/week?api_key=${Constants.apikey}";
  static const _topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}";
    static const _upComingUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apikey}";




  Future<List<Movie>>getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingaUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception("SOmething happened");
    }
  }

  Future<List<Movie>>getTopRatedMovies() async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception("SOmething happened");
    }
  }

  Future<List<Movie>>getUpComingMovies() async{
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception("SOmething happened");
    }
  }
}