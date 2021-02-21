import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobtech/pages/post.dart';
class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
GlobalKey<FormState> scaffold = new GlobalKey<FormState>();
  File _file;
  Future getImage() async{
    final myfile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile.path);
    });
  }
     uploadImage(){
    SnackBar snackbar = SnackBar(content: Text("Please select image"));
    if(_file ==null) return Scaffold.of(scaffold.currentContext).showSnackBar(snackbar);
    String base64 = base64Encode(_file.readAsBytesSync());
    String imageName = _file.path.split("/").last;
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return Post(imageName : imageName , base64 : base64);
    }));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: scaffold,
        child: Container(padding: EdgeInsets.only(top: 30),
          child: Column(children: [
            RaisedButton( child: Text("Select image") , onPressed: getImage),
            Center(child: _file == null? Text("No image selected") : Image.file(_file),),
            RaisedButton( child: Text("Upload image"),onPressed: uploadImage)
          ],),
        ),
      ),
    );
  }
}
