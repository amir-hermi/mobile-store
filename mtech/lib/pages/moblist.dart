import 'package:flutter/material.dart';
import './mobileDetails.dart';
class MobList extends StatelessWidget {
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

  MobList(
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
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 270,
            width: 200,
            child: Card(
                child: Row(children: [
              Expanded(
                  flex: 1,
                  child: GridTile(
                    child: Image.network("http://10.0.2.2/"+image_url),
                    footer:  Container(
                      color: Colors.black.withOpacity(0.6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              price,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.orange),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(children: [
                        Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                        Container(
                            child: Text(
                              date,
                          style: TextStyle(color: Colors.grey),
                        ))
                      ]),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Row(children: [
                        Icon(
                          Icons.airplay_sharp,
                          color: Colors.grey,
                        ),
                        Container(
                            child: Text(
                          ecran,
                          style: TextStyle(color: Colors.grey),
                        ))
                      ]),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Row(children: [
                        Icon(
                          Icons.settings,
                          color: Colors.grey,
                        ),
                        Container(
                            child: Text(
                          cpu,
                          style: TextStyle(color: Colors.grey),
                        ))
                      ]),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Row(children: [
                        Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.grey,
                        ),
                        Container(
                            child: Text(
                          camera,
                          style: TextStyle(color: Colors.grey),
                        ))
                      ]),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Row(children: [
                        Icon(
                          Icons.battery_charging_full_outlined,
                          color: Colors.grey,
                        ),
                        Container(
                            child: Text(
                          battery,
                          style: TextStyle(color: Colors.grey),
                        ))
                      ]),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Row(children: [
                        Icon(
                          Icons.storage,
                          color: Colors.grey,
                        ),
                        Container(
                            child: Text(
                          memory,
                          style: TextStyle(color: Colors.grey),
                        ))
                      ]),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Row(children: [
                        Icon(
                          Icons.memory_sharp,
                          color: Colors.grey,
                        ),
                        Container(
                            child: Text(
                          ram,
                          style: TextStyle(color: Colors.grey),
                        ))
                      ]),
                    ],
                  )))
            ]))),
        onTap: ()
    {
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return MobileDetails(id: id,name: name,camera: camera,resolution: resolution,date: date,battery: battery,camera_frontale: camera_frontale,cpu: cpu,ecran: ecran,image_url: image_url,memory: memory,price: price,ram: ram,);
      }));
    }
    );
  }
}
