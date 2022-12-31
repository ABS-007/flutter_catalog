import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.items});
  final Item items;
  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          // ignore: avoid_print
          print("${items.name} pressed");
        },
        leading: Image.network(items.image),
        title: Text(items.name),
        subtitle: Text(items.desc),
        trailing: Text(
          "\$${items.price}",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
