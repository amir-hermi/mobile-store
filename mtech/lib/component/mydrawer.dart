import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
   var email;
   var fullname;
  bool isLogin = false;
  getPref() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
     email = preferences.getString("email");
     fullname = preferences.getString("fullname");

    if(fullname != null){
      setState(() {
         email = preferences.getString("email");
         fullname = preferences.getString("fullname");
        isLogin=true;
      });
    }
  }
  @override
  void initState() {
    getPref();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  Drawer(
        child: ListView(
          children: [UserAccountsDrawerHeader(accountName: isLogin ? Text(fullname):Text(""),
            accountEmail:isLogin? Text(email):Text(""),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                    image: AssetImage("images/Drawer.jpg"), fit: BoxFit.fill
                )
            ),),
            ListTile(
              title: Text("Home page",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              leading: Icon(Icons.home, color: Colors.black,),
              //trailing: Icon(Icons.hot_tub),
              onTap: () {
                Navigator.of(context).pushNamed('home');
              },
            ),
            ListTile(
              title: Text("Catégories",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              leading: Icon(Icons.category, color: Colors.black,),
              //trailing: Icon(Icons.hot_tub),
              onTap: () {
                Navigator.of(context).pushNamed('Category');
              },

            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text("About the application",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              leading: Icon(Icons.info, color: Colors.black,),
              //trailing: Icon(Icons.hot_tub),
              onTap: () {
                Navigator.of(context).pushNamed('about');
              },
            ),
            ListTile(
              title: Text("Post",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              leading: Icon(Icons.post_add, color: Colors.black,),
              //trailing: Icon(Icons.hot_tub),
              onTap: () {
                Navigator.of(context).pushNamed('post');
              },
            ),
            ListTile(
              title: Text("basket",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              leading: Icon(Icons.shopping_basket, color: Colors.black,),
              //trailing: Icon(Icons.hot_tub),
              onTap: () {
                Navigator.of(context).pushNamed('setting');
              },
            ),

            ListTile(
              title: Text("Settings",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              leading: Icon(Icons.settings, color: Colors.black,),
              //trailing: Icon(Icons.hot_tub),
              onTap: () {
                Navigator.of(context).pushNamed('setting');
              },
            ),
            isLogin?ListTile(
              title: Text("LogOut",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              leading: Icon(Icons.logout, color: Colors.black,),
              //trailing: Icon(Icons.hot_tub),
              onTap: () async {
                SharedPreferences preferences=await SharedPreferences.getInstance();
                preferences.remove("fullname");
                preferences.remove("email");
                Navigator.of(context).pushNamed('LogIn');
              },
            ):ListTile(
              title: Text("LogIn",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              leading: Icon(Icons.login, color: Colors.black,),
              //trailing: Icon(Icons.hot_tub),
              onTap: () {
               Navigator.of(context).pushNamed('LogIn');
              },
            ),
          ],
        ));
  }
}

