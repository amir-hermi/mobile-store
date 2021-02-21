import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobtech/component/mydrawer.dart';
import 'package:mobtech/pages/comments.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
class Post extends StatefulWidget {
  String base64;
  String imageName;

  Post({this.base64, this.imageName});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  showdialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [Text("Loading ..."), CircularProgressIndicator()],
            ),
          );
        });
  }

  GlobalKey<FormState> FormKey = new GlobalKey<FormState>();
  var id;
  var email;
  var fullname;
  bool isLogin = false;
  bool LikeTest = false;
  TextEditingController postContent = TextEditingController();

  Future getPost() async {
    var url = "http://10.0.2.2:80/mtech/post.php";
    var responce = await http.get(url);
    var responcebody = convert.jsonDecode(responce.body);
    return responcebody;
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    id = preferences.getString("id");
    email = preferences.getString("email");
    fullname = preferences.getString("fullname");

    if (fullname != null) {
      setState(() {
        id = preferences.getString("id");
        email = preferences.getString("email");
        fullname = preferences.getString("fullname");
        isLogin = true;
      });
    }
  }
  Future testUserLike(idPost) async{
    var data =id;
    var url = "http://10.0.2.2:80/mtech/DisplayLikeTable.php/$data/$idPost";
    var responce  = await http.get(url);
    var responcebody = convert.jsonDecode(responce.body);
    if (responcebody["status"] == "fail"){
      addUserToLikeTable(idPost);
      update(idPost);
    }else if(responcebody["status"] == "success"){
      deleteUserFromLikeTable(idPost);
      updateM(idPost);
    }
    LikeTest =! LikeTest;
  }
   //
   // String verifLike(idPost){
   //   return testUserLike(idPost);
   //   }else return false;
   // }
  Future addUserToLikeTable(idPost) async{
    var data = { "idUser":id , "idPost":idPost};
    var url = "http://10.0.2.2:80/mtech/AddUserToLikeTable.php";
    var responce  = await http.post(url, body: data);
    var responcebody = convert.jsonDecode(responce.body);
    if(responcebody["status"]=="success"){
      setState(() {
        LikeTest = true;
      });
    };
  }
  Future deleteUserFromLikeTable(idPost) async{
    var data = id;
    var url = "http://10.0.2.2:80/mtech/DeleteUserFromLikeTable.php/$data/$idPost";
    var responce  = await http.delete(url);
    var responcebody = convert.jsonDecode(responce.body);
    if(responcebody["status"] =="success"){
      setState(() {
        LikeTest = false;
      });
    };
  }


  Future update(idPost) async{
    var data = { "idPost":idPost};
    var data1 = convert.jsonEncode(data);
    var url = "http://10.0.2.2:80/mtech/updateLike.php";
    var responce  = await http.put(url, body: data1);
    var responcebody = convert.jsonDecode(responce.body);
    return responcebody;
  }

  Future updateM(idPost) async{
    var data = { "idPost":idPost};
    var data1 = convert.jsonEncode(data);
    var url = "http://10.0.2.2:80/mtech/updateLikeM.php";
    var responce  = await http.put(url, body: data1);
    var responcebody = convert.jsonDecode(responce.body);
    return responcebody;
  }
  Future addPost() async {
    var formdata = FormKey.currentState;
    if (formdata.validate()) {
      formdata.save();
      //showdialog(context);
      if (widget.imageName == null) {
        SnackBar snackbar = SnackBar(
          content: Text("Please upload image"),
          action: SnackBarAction(
            label: "Upload",
            onPressed: () {
              Navigator.of(context).pushNamed("uploadimage");
            },
          ),
        );
        Scaffold.of(FormKey.currentContext).showSnackBar(snackbar);
      } else {
        var data = {
          "content": postContent.text,
          "id": id,
          "imagename": widget.imageName,
          "base64": widget.base64
        };
        var url = "http://10.0.2.2:80/mtech/addpost.php";
        var responce = await http.post(url, body: data);
        var responcebody = convert.jsonDecode(responce.body);
        if (responcebody["status"] == "success") {
          Navigator.of(context).pushNamed("post");
        }
      }
    }
  }


  String postvalidate(String val) {
    if (val.trim().isEmpty) {
      return "Post can't be Empty";
    }
  }

  @override




    void initState() {
    getPref();
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      drawer: MyDrawer(),
      body: !isLogin
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 50),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Icon(
                    Icons.post_add,
                    size: 300,
                    color: Colors.black26.withOpacity(0.1),
                  ),
                ),
                Container(
                  child: Text(
                    "Please LogIn First",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 100),
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          'LogIn',
                          style: TextStyle(fontSize: 16),
                        ),
                        color: Colors.deepOrange.shade700,
                        minWidth: 200,
                        onPressed: () {
                          Navigator.of(context).pushNamed("LogIn");
                        },
                      ),
                    ],
                  ),
                ),
              ]),
            )
          : ListView(
              children: [
                Form(
                  key: FormKey,
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: TextFormField(
                            controller: postContent,
                            validator: postvalidate,
                            maxLines: 10,
                            minLines: 1,
                            maxLength: 255,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Post your phone",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed("uploadimage");
                                  },
                                  child: Container(
                                    height: 35,
                                    child: Center(
                                        child: Icon(Icons.camera_alt_outlined,
                                            color: Colors.grey.shade500)),
                                  )),
                            ),
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    addPost();
                                  },
                                  child: Container(
                                    height: 35,
                                    child: Center(
                                        child: Icon(Icons.add_circle,
                                            color: Colors.grey.shade500)),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                FutureBuilder(
                    future: getPost() ,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 550,
                                child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, i) {
                                      return Card(
                                        elevation: 3,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CircleAvatar(
                                                child: Icon(Icons.person),
                                              ),
                                              title: Container(
                                                margin: EdgeInsets.only(
                                                    top: 15, bottom: 10),
                                                child: Text(snapshot.data[i]
                                                    ["username"]),
                                              ),
                                              trailing: Icon(Icons.menu),
                                              subtitle: Text(
                                                  snapshot.data[i]["content"]),
                                            ),
                                            Container(
                                              child: snapshot.data[i]
                                                          ["image"] !=
                                                      ""
                                                  ? Container(
                                                      child: Image.network(
                                                          "http://10.0.2.2:80/mtech/" +
                                                              snapshot.data[i]
                                                                  ["image"]))
                                                  : SizedBox(
                                                      width: 0,
                                                    ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: CircleAvatar(
                                                        child: Icon(
                                                            Icons.thumb_up_alt),
                                                        backgroundColor:
                                                            Colors.blue,
                                                      )),
                                                  Container(
                                                    child: Text(
                                                      snapshot.data[i]
                                                          ["post_like"],
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey.shade300,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 5,
                                                                bottom: 5),
                                                        child: InkWell(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .thumb_up_alt_outlined,
                                                                // ignore: unrelated_type_equality_checks
                                                                color:LikeTest == true? Colors
                                                                    .blue
                                                                    .shade400 : Colors.grey,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "Like",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ],
                                                          ),
                                                          onTap: () {
                                                            setState(() {
                                                              testUserLike(snapshot.data[i]["id"]);
                                                            });

                                                          }
                                                        ))),
                                                Expanded(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 5,
                                                                bottom: 5),
                                                        child: InkWell(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .mode_comment_outlined,
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text("comment",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey)),
                                                            ],
                                                          ),
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder:
                                                                        (context) {
                                                              return Comments(
                                                                  postId: snapshot
                                                                          .data[
                                                                      i]["id"]);
                                                            }));
                                                          },
                                                        )))
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    })
              ],
            ),
    );
  }
}

// for (var i = snapshot.data.length - 1;
//     i >= 0;
//     i--)
//   PostList(
//     name: snapshot.data[i]["username"],
//     content: snapshot.data[i]["content"],
//     postId: snapshot.data[i]["id"],
//     image: snapshot.data[i]["image"],
//     like:snapshot.data[i]["post_like"]
//   ),
