// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<String>? _$pageTitleComputed;

  @override
  String get pageTitle => (_$pageTitleComputed ??=
          Computed<String>(() => super.pageTitle, name: '_HomeStore.pageTitle'))
      .value;

  late final _$movieTitleAtom =
      Atom(name: '_HomeStore.movieTitle', context: context);

  @override
  String get movieTitle {
    _$movieTitleAtom.reportRead();
    return super.movieTitle;
  }

  @override
  set movieTitle(String value) {
    _$movieTitleAtom.reportWrite(value, super.movieTitle, () {
      super.movieTitle = value;
    });
  }

  late final _$pageTypeAtom =
      Atom(name: '_HomeStore.pageType', context: context);

  @override
  MovieListType get pageType {
    _$pageTypeAtom.reportRead();
    return super.pageType;
  }

  @override
  set pageType(MovieListType value) {
    _$pageTypeAtom.reportWrite(value, super.pageType, () {
      super.pageType = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void getTrendingMovies() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getTrendingMovies');
    try {
      return super.getTrendingMovies();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getPopularMovies() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getPopularMovies');
    try {
      return super.getPopularMovies();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getFindMovie(String movieName) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getFindMovie');
    try {
      return super.getFindMovie(movieName);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMovieType(MovieListType type) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.updateMovieType');
    try {
      return super.updateMovieType(type);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieTitle: ${movieTitle},
pageType: ${pageType},
pageTitle: ${pageTitle}
    ''';
  }
}
