import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import 'addtocart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailsPage(catalog: catalog))),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeightBox(20),
            catalog.name.text.color(context.accentColor).lg.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make().py1(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.make(),
                AddToCart(catalog: catalog),
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}

