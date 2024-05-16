import 'package:flutter/material.dart';

import '../../model/movie_list_type.dart';

class ToggleButton extends StatelessWidget {
  final MovieListType type;
  final Function(MovieListType) onCLick;

  const ToggleButton(
      {Key? key, required this.type, required this.onCLick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        if (index == 0) {
          onCLick(MovieListType.trending);
        } else if (index == 1) {
          onCLick(MovieListType.popular);
        }
      },
      isSelected: [type == MovieListType.trending, type == MovieListType.popular],
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
    );
  }
}