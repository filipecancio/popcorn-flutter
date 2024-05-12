import 'package:mobx/mobx.dart';

import '../../model/movie.dart';
import '../../repository/pop_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  PopRepository repository = PopRepository();

  _HomeStore();

  ObservableList<Movie> movieList = ObservableList<Movie>();

  @computed
  String get movieTitle => movieList.isNotEmpty ? movieList.first.title : '';

  @action
  void getTrendingMovies() {
    repository.getTrendingMovies().then((response) {
      movieList = ObservableList.of(response.toList());
    });
  }
}
