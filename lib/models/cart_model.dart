import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  late CatalogModel catalog;

  //collection of ids to be stroed in list
  final List<int> _itemIDs = [];

  //Get items in the cart
  Iterable get items => _itemIDs.map((id) => catalog.getbyid(id));

  num get totalprice => items.fold(0, (total, current) => total + current);

  //add item
  void add(Item item) {
    _itemIDs.add(item.id);
  }

  // remove item
  void remove(Item item) {
    _itemIDs.remove(item.id);
  }
}
