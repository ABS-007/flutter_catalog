import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import '../models/catalog.dart';

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
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final items = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                          decoration: BoxDecoration(color: Colors.deepPurple),
                          child: Text(
                            items.name,
                            style: TextStyle(color: Colors.white),
                          )),
                      footer: Container(
                          decoration: BoxDecoration(color: Colors.black),
                          child: Text(
                            items.price.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                      child: Image.network(items.image),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )

            //  ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (BuildContext context, int index) => ItemWidget(
            //           items: CatalogModel.items[index],
            //         ))
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
