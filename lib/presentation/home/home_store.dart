import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../model/movie.dart';
import '../../repository/pop_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  PopRepository repository = PopRepository();

  ObservableList<Movie> movieList = ObservableList<Movie>();

  @computed
  String get movieTitle => movieList.isNotEmpty ? movieList.first.title : 'prai';

  @action
  void getTrendingMovies() {
    log('movieList: $movieTitle');
    repository.getTrendingMovies().then((response) {
      movieList.clear();
      movieList.addAll(response.toList());
      log('movieTitle: $movieTitle');
    });
  }

  String movieListToString(List<Movie> list) => list.map((e) => e.toString()).toString();
}
