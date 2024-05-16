// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<String>? _$movieTitleComputed;

  @override
  String get movieTitle =>
      (_$movieTitleComputed ??= Computed<String>(() => super.movieTitle,
              name: '_HomeStore.movieTitle'))
          .value;

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
  String toString() {
    return '''
movieTitle: ${movieTitle}
    ''';
  }
}
