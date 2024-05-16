import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcorn/components/molecules/web_header.dart';
import 'package:popcorn/presentation/home/home_store.dart';
import 'dart:math' as math;

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
      appBar: WebHeader(
          type: store.pageType,
          onCLick: store.updateMovieType,
          onChanged: (value) {
            store.getFindMovie(value);
          }),
      //appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: const Text("Popcorn"),),
      body: Center(
        child: Observer(builder: (_) {
          return LayoutBuilder(builder: (context,constraints){
            double maxWidth =  math.min(constraints.maxWidth * 0.8, 1000.0);
            return SizedBox(
              width: maxWidth,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(store.pageTitle,
                          style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Color(0xFF5F2832))),
                    ),
                  ),
                  Expanded(
                      child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // Define the number of columns
                        ),
                        itemCount: store.movieList.length,
                        itemBuilder: (context, index) {
                          return ItemList(movie: store.movieList[index]);
                        },
                      ))
                ],
              )
            );
          });
        }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
