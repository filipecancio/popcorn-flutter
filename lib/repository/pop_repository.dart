import 'package:popcorn/repository/pop_api.dart';
import 'package:popcorn/repository/query_parameter.dart';
import 'package:popcorn/repository/query_parameter_type.dart';

import '../model/movie.dart';

class PopRepository {
  PopApi api = PopApi();

  Future<List<Movie>> getTrendingMovies() async {
    final data = await api.getTheMovieDB(path: "trending/movie/day");
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getPopularMovies() async {
    final data = await api.getTheMovieDB(path: "movie/popular");
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getFindMovie(String movieName) async {
    final data = await api.getTheMovieDB(
        path: "search/movie",
        parameterList: [QueryParameter(QueryParameterType.query, movieName)]);
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }
}
