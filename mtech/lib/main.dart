
import 'package:flutter/material.dart';
import 'package:mobtech/pages/about.dart';
import 'package:mobtech/pages/apple.dart';
import 'package:mobtech/pages/comments.dart';

import 'package:mobtech/pages/home.dart';
import 'package:mobtech/pages/category.dart';
import 'package:mobtech/pages/huawei.dart';
import 'package:mobtech/pages/login.dart';
import 'package:mobtech/pages/mobileDetails.dart';
import 'package:mobtech/pages/oneplus.dart';
import 'package:mobtech/pages/oppo.dart';
import 'package:mobtech/pages/post.dart';
import 'package:mobtech/pages/setting.dart';
import 'package:mobtech/pages/sumsung.dart';
import 'package:mobtech/pages/uploadImage.dart';
import 'package:mobtech/pages/xiaomi.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //start
      title: "MobTech",
      theme: ThemeData(fontFamily: 'BalsamiqSans'),
      home:Home(),
      routes: {
        'Category' : (context){
          return Category() ;
        },
        'home' : (context){
          return Home() ;
        },
        'about': (context){
          return about();
        },
        'setting':(context){
          return setting();
        },
        'sumsung':(context){
          return sumsung();
        },
        'comments':(context){
          return Comments();
        },
        'LogIn':(context){
          return Login();
        },
        'uploadimage':(context){
          return UploadImage();
        },

        'apple':(context){
          return Apple();
        },
        'huawei':(context){
          return Huawei();
        },
        'oppo':(context){
          return Oppo();
        },
        'oneplus':(context){
          return OnePlus();
        },
        'Xiaomi':(context){
          return Xiaomi();
        },
        'post':(context){
          return Post();
        },

      },
    );
}

}