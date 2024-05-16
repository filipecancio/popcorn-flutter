import 'package:flutter/material.dart';

class ImageRect extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double radius;

  const ImageRect(
      {Key? key, required this.imageUrl, this.width = 100, this.height = 150, this.radius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(
          imageUrl,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ));
  }
}
