
import 'package:flutter/material.dart';

import '../../model/movie.dart';

class ItemList extends StatelessWidget {
  final Movie movie;

  const ItemList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(movie.posterPath),
        Text(movie.title),
      ]
    );
  }
}