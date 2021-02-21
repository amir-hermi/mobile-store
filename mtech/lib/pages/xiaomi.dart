import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:mobtech/component/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'moblist.dart';

class Xiaomi extends StatefulWidget {
  State<StatefulWidget> createState() {
    return XiaomiState();
  }
}

class XiaomiState extends State<Xiaomi> {
  Future getData() async {
    var data = {"id":"6"};
    var url = "http://10.0.2.2:80/mtech/test1.php";
    var responce = await http.post(url,body: data);
    var responsebody = convert.jsonDecode(responce.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Xiaomi"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return MobList(
                      id: snapshot.data[i]['id'],
                      name: snapshot.data[i]['name'],
                      ecran: snapshot.data[i]['ecran'],
                      camera: snapshot.data[i]['camera'],
                      cpu: snapshot.data[i]['cpu'],
                      memory: snapshot.data[i]['memory'],
                      ram: snapshot.data[i]['ram'],
                      price: snapshot.data[i]['price'],
                      battery: snapshot.data[i]['battery'],
                      date: snapshot.data[i]['_date'],
                      image_url: snapshot.data[i]['image_url'],
                      camera_frontale:snapshot.data[i]['camera_f'] ,
                      resolution: snapshot.data[i]['resolution'],

                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
