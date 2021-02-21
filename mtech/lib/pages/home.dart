import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:mobtech/component/mydrawer.dart';
import 'dart:async';
import 'dart:convert'as convert;
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {

  State<StatefulWidget> createState() {

    return HomeState();
  }

}
class HomeState extends State<Home> {
  Future getData() async {
    var data = {"add_last_update": "true"};
    var url = "http://10.0.2.2:80/mtech/add_mob_to_update.php";
    var responce = await http.post(url, body: data);
    var responsebody = convert.jsonDecode(responce.body);
    return responsebody;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Mtech"),
          backgroundColor: Colors.black26,
          actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
          centerTitle: true,
          elevation: 10,
          // leading: IconButton(icon: Icon(Icons.security)),
        ),
        drawer: MyDrawer(),
        body: ListView(
            children: [
              Container(
                height: 200.0,
                width: double.infinity,
                child: Card(
                  child: Carousel(
                    animationCurve: Curves.easeInToLinear,
                    images: [
                      Image.asset(
                        'images/iphone12.webp',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'images/samsung s20 ultra.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                    dotBgColor: Colors.black.withOpacity(0.5),
                    indicatorBgPadding: 5,
                    dotColor: Colors.white,
                    dotIncreasedColor: Colors.deepOrange,
                    dotIncreaseSize: 1.5,
                    autoplayDuration: Duration(seconds: 30),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 3)),
              Container(
                  height: 40,
                  padding: EdgeInsets.all(1),
                  child: GridTile(
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Categories",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                height: 1.6,
                                fontSize: 18,
                                color: Colors.black)),
                      ),
                      color: Colors.deepOrange,
                    ),
                  )),
              //start Category
              Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/Samsung-logo.png',
                            width: 80,
                            height: 80,
                          ),
                          subtitle: Container(
                            child: Text(
                              "Sumsung",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('sumsung');
                          },
                        )),
                    Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/iphone-logo.png',
                            width: 80,
                            height: 80,
                          ),
                          subtitle: Container(
                            child: Text("Iphone",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('apple');
                          },
                        )),
                    Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/huawei-logo.png',
                            width: 80,
                            height: 80,
                          ),
                          subtitle: Container(
                            child: Text("Huawei",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('huawei');
                          },
                        )),
                    Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/oppo-logo.png',
                            width: 80,
                            height: 80,
                          ),
                          subtitle: Container(
                            child: Text("Oppo",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('oppo');
                          },
                        )),
                    Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/oneplus-logo.webp',
                            width: 80,
                            height: 80,
                          ),
                          subtitle: Container(
                            child: Text("Oneplus",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('oneplus');
                          },
                        )),
                    Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                          title: Image.asset(
                            'images/category/xiaomi-logo.webp',
                            width: 80,
                            height: 80,
                          ),
                          subtitle: Container(
                            child: Text("Xiaomi",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('Xiaomi');
                          },
                        )),
                  ],
                ),
              ),
              //end Category
              Container(
                  height: 40,
                  padding: EdgeInsets.all(1),
                  child: GridTile(
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Derniére mise a jour",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                height: 1.6,
                                fontSize: 18,
                                color: Colors.black)),
                      ),
                      color: Colors.deepOrange,
                    ),
                  )),


             SingleChildScrollView(
                  child:
                    Container(
                      height: 300,
                      width: 250,
                      child: FutureBuilder(
                          future: getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return
                                Container(
                                  height: 200,
                                  width: 200,
                                  child:GridView.builder(
                                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, i) {
                                        return
                                          Container(
                                            height: 200,
                                            width: 200,
                                            child: Card(
                                                child: InkWell(
                                                    child: GridTile(
                                                        child:
                                                        Image.network(
                                                            "http://10.0.2.2/" +
                                                                snapshot
                                                                    .data[i]['image_url']),
                                                        footer: Container(
                                                            color: Colors
                                                                .black
                                                                .withOpacity(
                                                                0.5),
                                                            child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      snapshot
                                                                          .data[i]['name'],
                                                                      textAlign: TextAlign
                                                                          .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .orange),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      snapshot
                                                                          .data[i]['price'],
                                                                      textAlign: TextAlign
                                                                          .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .orange),
                                                                    ),
                                                                  )
                                                                ]))))),
                                          );
                                      }),
                                );
                            }
                            return Center(child: CircularProgressIndicator());
                            //start latest products

                          }),
                    )
             ,
            )




            ]));
  }


}
