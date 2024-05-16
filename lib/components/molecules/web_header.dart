import 'package:flutter/material.dart';
import 'package:popcorn/components/molecules/search_input.dart';
import 'package:popcorn/components/molecules/toggle_button.dart';

import '../../model/movie_list_type.dart';

class WebHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  final MovieListType type;
  final Function(MovieListType) onCLick;
  final Function(String) onChanged;

  const WebHeader(
      {Key? key,
      required this.type,
      required this.onCLick,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Text("Popcorn"),
            SearchInput(onChanged: onChanged),
            ToggleButton(type: type, onCLick: onCLick)
          ],
        ),
      ),
    );
  }
}
