import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: Center(child: "Cart".text.xl2.make()),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        "\$${_cart.totalprice}".text.xl4.make(),
        ElevatedButton(
          onPressed: (() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "This feature will be available soon".text.make()));
          }),
          style: ButtonStyle(
              backgroundColor:
                  // ignore: deprecated_member_use
                  MaterialStateProperty.all(context.theme.buttonColor)),
          child: "Buy".text.make(),
        )
      ],
    ).px16();
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Cart is Empty".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: _cart.items[index].name.text.make(),
              trailing: Icon(Icons.remove_circle_outline),
            ),
          );
  }
}
