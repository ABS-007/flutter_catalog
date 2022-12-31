import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../models/catalog.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    print(productsData);
  }

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
