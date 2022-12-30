import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.items});
  final Item items;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(items.image),
      title: Text(items.name),
      subtitle: Text(items.desc),
      trailing: Text(items.price.toString()),
    );
  }
}
