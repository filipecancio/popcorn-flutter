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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFAFBD),
            Color(0xFFFFC3A0),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Popcorn",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 30.0,
              ),
            ),
            Row(children: [
              SearchInput(onChanged: onChanged),
              const SizedBox(width: 16.0),
              ToggleButton(type: type, onCLick: onCLick)
            ])
          ],
        ),
      ),
    );
  }
}
