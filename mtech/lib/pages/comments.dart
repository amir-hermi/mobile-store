import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class Comments extends StatefulWidget {
  final postId;

  Comments({this.postId });

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {

  var idUser;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idUser = preferences.getString("id");
    if (idUser != null) {
      setState(() {
        idUser = preferences.getString("id");
      });
    }
  }
  void initState() {
    getPref();
    super.initState();
  }
  showdialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Row(children: [Text("Loading ..." ) , CircularProgressIndicator()],),);
        });
  }

  GlobalKey<FormState> CommentForm = new GlobalKey<FormState>();
  TextEditingController comment = TextEditingController();
  String commentValid(String val){
    if(val.trim().isEmpty){
      return "Comment can't be Empty";
    }
  }
  Future addComments() async {
    var formdata =CommentForm.currentState;
    if(formdata.validate()){
      formdata.save();
      showdialog(context);
      var data = { "comment":comment.text,"comment_user":idUser,"postId": widget.postId};
      var url = "http://10.0.2.2:80/mtech/addcomment.php";
      var responce = await http.post(url, body: data);
      var responcebody = jsonDecode(responce.body);
      if(responcebody["status"]=="success"){
        Navigator.of(context).pop();
        comment.clear();
      }

    }

  }


  Future getComments() async {
    var data = {"postId": widget.postId};
    var url = "http://10.0.2.2:80/mtech/getcomments.php";
    var responce = await http.post(url, body: data);
    var responcebody = jsonDecode(responce.body);
    return responcebody;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
              top: 30,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 90,
                child: SingleChildScrollView(
                    child: FutureBuilder(
                  future: getComments(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < snapshot.data.length; i++)
                            commentList(
                              commentUserName: snapshot.data[i]["fullname"],
                              content: snapshot.data[i]["comment"],
                            )
                        ],
                      );
                    } else
                      return CircularProgressIndicator();
                  },
                )),
              )),
          Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey.shade300))),
                    child: Row(
                      children: [
                        IconButton(
                            padding: EdgeInsets.only(left: 10),
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              size: 30,
                              color: Colors.black26,
                            ),
                            onPressed: () {}),
                        Container(
                          width: MediaQuery.of(context).size.width - 50,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Form(
                            key: CommentForm,
                            child: TextFormField(
                              validator: commentValid,
                              controller: comment,
                              decoration: InputDecoration(
                                  hintText: "Your comment",
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  suffixIcon: Container(
                                    child: IconButton(
                                      icon: Icon(Icons.send),
                                      onPressed: () {addComments();},
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(60),
                                      borderSide:
                                          BorderSide(style: BorderStyle.none)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(60),
                                      borderSide:
                                          BorderSide(style: BorderStyle.none))),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      )),
    );
  }
}

class commentList extends StatelessWidget {
  String commentUserName = "none";
  String content = "none";

  commentList({this.commentUserName, this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          commentUserName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Container(
          padding: EdgeInsets.only(top: 5),
          child: Card(
            elevation: 2,
            color: Colors.grey.shade300,
            child: Text(content),
          )),
    );
  }
}
