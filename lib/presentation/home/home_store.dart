import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../model/movie.dart';
import '../../model/movie_list_type.dart';
import '../../repository/pop_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  PopRepository repository = PopRepository();

  ObservableList<Movie> movieList = ObservableList<Movie>();

  @observable
  MovieListType pageType = MovieListType.trending;

  @computed
  String get movieTitle => movieList.isNotEmpty ? movieList.first.title : '';

  @action
  void getTrendingMovies() {
    repository.getTrendingMovies().then((response) {
      movieList.clear();
      movieList.addAll(response.toList());
    });
  }

  @action
  void getPopularMovies() {
    repository.getPopularMovies().then((response) {
      movieList.clear();
      movieList.addAll(response.toList());
    });
  }

  @action
  void getFindMovie(String movieName) {
    repository.getFindMovie(movieName).then((response) {
      movieList.clear();
      movieList.addAll(response.toList());
    });
  }

  @action
  void updateMovieType(MovieListType type) {
    pageType = type;
    if(type == MovieListType.trending) {
      getTrendingMovies();
    } else {
      getPopularMovies();
    }
  }
}
