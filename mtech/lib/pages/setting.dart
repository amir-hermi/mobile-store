import 'package:flutter/material.dart';
import 'package:mobtech/component/mydrawer.dart';
class setting extends StatefulWidget {
  State<StatefulWidget> createState() {
    return SettingState();
  }
}
class SettingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Catégories"),
        centerTitle: true,

      ),
      drawer: MyDrawer(),
      body: Container(child: Text("setting"),),
    );
  }
}