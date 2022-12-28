import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "ABS",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Center(child: Text("Welcome to My World")),
      drawer: MyDrawer(),
    );
  }
}
