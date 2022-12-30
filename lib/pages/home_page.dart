import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../models/catalog.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(10, (index) => CatalogModel.items[0]);
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
        itemCount: dummylist.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemWidget(
            items: dummylist[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
