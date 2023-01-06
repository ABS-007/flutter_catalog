import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../themes.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .size(80, 100)
        .rounded
        .color(MyThemes.creamColor)
        .make()
        .p16();
  }
}