import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final Function(String) onChanged;

  const SearchInput({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFFFC5BB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFFD96A8),
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          onChanged: onChanged,
          decoration: const InputDecoration(
            hintText: 'Pesquisar',
            border: InputBorder.none,
          ),
        ),
      )
    );
  }
}
