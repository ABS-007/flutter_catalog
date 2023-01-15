import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/home_page_widgets.dart/addtocart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  const HomeDetailsPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  height: 20,
                  child: Container(
                    width: context.screenWidth,
                    color: context.cardColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeightBox(20),
                        catalog.name.text
                            .color(context.cardColor)
                            .xl3
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .lg
                            .make()
                            .py1(),
                        "Takimata lorem vero diam amet kasd tempor stet sit ipsum sea. Elitr ipsum sit magna takimata takimata gubergren sed eos. Sadipscing nonumy ipsum gubergren ipsum et. Et eos consetetur sit ipsum accusam stet sea, lorem sanctus accusam dolore aliquyam eos eos invidunt amet. At vero dolore tempor sea gubergren, no."
                            .text
                            .align(TextAlign.center)
                            .textStyle(context.captionStyle)
                            .make()
                            .p16(),
                      ],
                    ),
                  )),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.green400.bold.xl2.make(),
                AddToCart(catalog: catalog).wh(130, 50)
              ],
            ).p16()
          ],
        ),
      ),
    );
  }
}
