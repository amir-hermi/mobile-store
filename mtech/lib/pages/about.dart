import 'package:flutter/material.dart';
import 'package:mobtech/component/mydrawer.dart';
class about extends StatefulWidget {
  State<StatefulWidget> createState() {
    return AboutState();
  }
}
class AboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,

      ),
      drawer: MyDrawer(),
      body: Container(child: Text("about"),),
    );
  }
}