import 'package:popcorn/repository/pop_api.dart';

import '../model/movie.dart';

class PopRepository {
  PopApi api = PopApi();

  Future<List<Movie>> getTrendingMovies() async {
    final data = await api.getTheMovieDB("trending/movie/day");
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }
}