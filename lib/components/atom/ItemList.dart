import 'package:flutter/material.dart';

import '../../model/movie.dart';
import 'image_rect.dart';

class ItemList extends StatelessWidget {
  final Movie movie;

  const ItemList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImageRect(imageUrl: movie.poster),
      Text(movie.title,
          style: TextStyle(
            fontFamily: 'Montserrat',
          )),
    ]);
  }
}
