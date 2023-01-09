import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Catalog App".text.bold.xl5.color(context.theme.accentColor).make(),
        // ignore: deprecated_member_use
        "Trending Products".text.xl2.color(context.theme.accentColor).make(),
      ],
    );
  }
}
