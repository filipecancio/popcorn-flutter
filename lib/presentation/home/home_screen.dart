import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcorn/model/movie_list_type.dart';
import 'package:popcorn/presentation/home/home_store.dart';

import '../../components/atom/ItemList.dart';
import '../../model/movie.dart';
import '../../repository/pop_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore store = HomeStore();

  Movie? movie;
  PopRepository repository = PopRepository();

  @override
  void initState() {
    store.getTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Popcorn"),
      ),
      body: Center(
        child: Observer(builder: (_) {
          return Column(
            children: [
              ToggleButtons(
                onPressed: (int index) {
                  if (index == 0) {
                    store.updateMovieType(MovieListType.trending);
                  } else if (index == 1) {
                    store.updateMovieType(MovieListType.popular);
                  }
                },
                isSelected: [store.pageType == MovieListType.trending, store.pageType == MovieListType.popular],
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Trending'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Popular'),
                  ),
                ],
              ),
              Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Define the number of columns
                ),
                itemCount: store.movieList.length,
                itemBuilder: (context, index) {
                  return ItemList(movie: store.movieList[index]);
                },
              ))
            ],
          );
        }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
