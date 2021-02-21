import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileDetails extends StatefulWidget {
  String id;
  String name;
  String ecran;
  String camera;
  String cpu;
  String battery;
  String memory;
  String ram;
  String price;
  String date;
  String image_url;
  String camera_frontale;
  String resolution;

  MobileDetails(
      {this.id,
        this.name,
        this.ecran,
        this.camera,
        this.cpu,
        this.battery,
        this.memory,
        this.ram,
        this.price,
        this.date,
        this.image_url,
        this.camera_frontale,
        this.resolution});
  @override
  _MobileDetailsState createState() => _MobileDetailsState();
}

class _MobileDetailsState extends State<MobileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 2,
          title: Text("${widget.name}"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
                height: 300,
                child: GridTile(
                  child: Image.network("http://10.0.2.2/"+widget.image_url),
                  footer: Container(
                    color: Colors.black.withOpacity(0.5),
                    height: 20,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "${widget.name}",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "${widget.price}",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5, top: 30),
                  child: Container(
                    height: 30,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(70),
                            bottomLeft: Radius.circular(20))),
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: Container(
                        child: Text(
                      "Description",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
                  ),
                ),
                Divider(
                  indent: 6,
                  color: Colors.red.shade900,
                  thickness: 1,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 20),
                  child: RichText(text: TextSpan(children: [
                    TextSpan(text:"Ecran :" , style: TextStyle(color: Colors.grey.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:"${widget.ecran}" , style: TextStyle(color: Colors.red.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:" -Résolution:" , style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold)),
                    TextSpan(text:" (${widget.resolution})" , style: TextStyle(color: Colors.red.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:" Processeur:" , style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold)),
                    TextSpan(text:"${widget.cpu}" , style: TextStyle(color: Colors.red.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:" -Mémoire RAM :" , style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold)),
                    TextSpan(text:"${widget.ram}" , style: TextStyle(color: Colors.red.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:"Stockage: " , style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold)),
                    TextSpan(text:"${widget.memory}" , style: TextStyle(color: Colors.red.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:" -Appareil photo Arriere: " , style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold)),
                    TextSpan(text:"${widget.camera}" , style: TextStyle(color: Colors.red.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:"-Appareil Photo Frontale: " , style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold)),
                    TextSpan(text:"${widget.camera_frontale}" , style: TextStyle(color: Colors.red.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:" ,avec Wifi,4G et Bluetooth ," , style: TextStyle(color: Colors.grey.shade700)),
                    TextSpan(text:"Capacité Batterie:" , style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold)),
                    TextSpan(text:"${widget.battery}" , style: TextStyle(color: Colors.red.shade800 , fontWeight: FontWeight.bold) ),
                    TextSpan(text:"-Coupe Silicone & Film de protection inclus Garantie :1an" , style: TextStyle(color: Colors.grey.shade700)),

    ]),)



                ),
                Container(
                  padding: EdgeInsets.only(left: 5, top: 30),
                  child: Container(
                    height: 30,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(70),
                            bottomLeft: Radius.circular(20))),
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: Container(
                        child: Text(
                      "Fiche technique",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
                  ),
                ),
                Divider(
                  indent: 12,
                  color: Colors.red.shade900,
                  thickness: 1,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey),
                          top: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 20 , top: 10),
                        child: Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            border:
                                Border(right: BorderSide(color: Colors.grey))),
                      )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.date} ",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                        child: Text(
                          "Ecran",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            border:
                                Border(right: BorderSide(color: Colors.grey))),
                      )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.ecran}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Résolution de l'écran",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.resolution}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Processeur",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.cpu}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Batterie",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.battery}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "RAM",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.ram}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Stockage",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.memory}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Appareil photo Arriere",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.camera}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Appareil photo frontale",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.camera_frontale}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Batterie",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("${widget.battery}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Connéctivité sans-fil",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("Wifi+4G",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text(
                              "Garantie",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                border:
                                Border(right: BorderSide(color: Colors.grey))),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20 ,top: 10),
                            child: Text("1 an",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ))
                    ],
                  ),
                ),




              ],
            )
          ],
        ));
  }
}
