import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../model/movie.dart';
import '../../repository/pop_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  PopRepository repository = PopRepository();

  ObservableList<Movie> movieList = ObservableList<Movie>();

  @observable
  String pageTitle = '';

  @computed
  String get movieTitle => movieList.isNotEmpty ? movieList.first.title : '';

  @action
  void getTrendingMovies() {
    repository.getTrendingMovies().then((response) {
      movieList.clear();
      movieList.addAll(response.toList());
      pageTitle = 'Trending Movies';
    });
  }

  @action
  void getPopularMovies() {
    repository.getPopularMovies().then((response) {
      movieList.clear();
      movieList.addAll(response.toList());
      pageTitle = 'Popular Movies';
    });
  }

  @action
  void getFindMovie(String movieName) {
    repository.getFindMovie(movieName).then((response) {
      movieList.clear();
      movieList.addAll(response.toList());
      pageTitle = 'Finding Movies who has: $movieName';
    });
  }
}
