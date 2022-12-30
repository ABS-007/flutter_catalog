import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../models/catalog.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Catalog App",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemWidget(items: CatalogModel.items[index],);
      },
    ),
      drawer: MyDrawer(),
    );
  }
}
