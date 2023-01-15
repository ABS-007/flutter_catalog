import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  late CatalogModel _catalog;

//collection of ids to be stroed in list
  final List<int> _itemIDs = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  void set(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIDs.map((id) => _catalog.getbyid(id)).toList();

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIDs.add(item.id);
  }

  // remove item
  void remove(Item item) {
    _itemIDs.remove(item.id);
  }
}
