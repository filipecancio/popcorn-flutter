import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        child: Observer(
          builder: (_) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Define the number of columns
              ),
              itemCount: store.movieList.length,
              itemBuilder: (context, index) {
                return ItemList(movie: store.movieList[index]);
              },
            );
          }
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}