import 'package:flutter/material.dart';
import 'package:mobtech/component/mydrawer.dart';
class Category extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CategoryState();
  }
}
class CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Catégories"),
        centerTitle: true,

      ),
      drawer: MyDrawer(),
      body: Container(child: Text("Categories"),),
    );
  }
}