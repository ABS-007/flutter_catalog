import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart_model.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
        onPressed: () {
          final _catalog = CatalogModel();
          _cart.set(_catalog);
          isInCart ? _cart.remove(widget.catalog) : _cart.add(widget.catalog);
          isInCart = isInCart.toggle();
          setState(() {});
        },
        style: ButtonStyle(
          backgroundColor:
              // ignore: deprecated_member_use
              MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        child: isInCart ? Icon(Icons.done) : "Add to cart".text.make());
  }
}
