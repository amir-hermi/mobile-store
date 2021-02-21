import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  //start Form Controller
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formStateLogIn = new GlobalKey<FormState>(); // key login
  GlobalKey<FormState> formStateSignUp = new GlobalKey<FormState>(); // key sign up

  savePref(String id ,String email , String fullname) async{
    SharedPreferences pereferences = await SharedPreferences.getInstance();

    pereferences.setString("id",id);
    pereferences.setString("fullname",fullname);
    pereferences.setString("email",email);
  }

  showdialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Row(children: [Text("Loading ..." ) , CircularProgressIndicator()],),);
        });
  }

  String validFullname(String val) {
    if (val.trim().isEmpty) {
      return "FullName can't be empty";
    } else if (val.trim().length <= 4) {
      return "FullName mast have atleast 4 caracters";
    }
  }

  String validEmail(String val) {
    if (val.isEmpty) {
      return "Email can't be empty";
    } else if (!EmailValidator.validate(val)) {
      return "Invalid email format";
    }
  }

  String validpassword(String val) {
    if (val.isEmpty) {
      return "Password can't be empty";
    }
  }

  String validconfirmpassword(String val) {
    if (val.isEmpty) {
      return "Password can't be empty";
    } else if (val != password.text) {
      return "Invalid password confirmation";
    }
  }

  login() async {
    var formdata = formStateLogIn.currentState;
    if (formdata.validate()) {
      formdata.save();
      showdialog(context);
      var data = {"email": email.text, "password": password.text};
      var url = "http://10.0.2.2:80/mtech/login.php";
      var responce = await http.post(url, body: data);
      var responcebedy = convert.jsonDecode(responce.body);
      if (responcebedy['status'] == "success") {
         savePref(responcebedy["id"],responcebedy["fullname"],responcebedy["email"]);
        Navigator.of(context).pushNamed('home');
      } else {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        final snackBar = SnackBar(
          content: Text('Login Failed'),
        );

        Scaffold.of(formStateLogIn.currentContext).showSnackBar(snackBar);
      }
    }
  }

  signup() async {
    var formdata = formStateSignUp.currentState;
    if (formdata.validate()) {
      showdialog(context);
      var data = {
        "email": email.text,
        "password": password.text,
        "fullname": fullname.text
      };
      var url = "http://10.0.2.2:80/mtech/signup.php";
      var responce = await http.post(url, body: data);
      var responcebedy = convert.jsonDecode(responce.body);
      if (responcebedy['status'] == "success") {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        final snackBar = SnackBar(content: Text('SignUp success') , action: SnackBarAction(
          label: 'LogIn',
          onPressed: (){
            setState(() {
              showsignin = !showsignin;
            });
          },
        ),);
        Scaffold.of(formStateSignUp.currentContext).showSnackBar(snackBar);

      } else if (responcebedy['status'] == "email found") {

        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        final snackBar = SnackBar(
          content: Text('SignUp Failed : email already exist '),
        );
        Scaffold.of(formStateSignUp.currentContext).showSnackBar(snackBar);
      }
    }
  }

  TapGestureRecognizer changesign;

  bool showsignin = true;

  void initState() {
    changesign = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showsignin = !showsignin;
        });
      };
    super.initState();
  }

  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Builder(builder: (context) {
        return Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            PositionBottom(mdw), //method
            TopPositionBottom(mdw), //method
            Container(
              child: SingleChildScrollView(
                child: Column(children: [
                  Center(
                      child: Container(
                          margin: showsignin
                              ? EdgeInsets.only(top: 60)
                              : EdgeInsets.only(top: 20),
                          child: Text(
                            showsignin ? "Log In" : "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ))),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  CircularAvatar(mdw),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  showsignin ? FormBoxLogIn(mdw) : FormBoxSignUp(mdw), //Method,
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        showsignin
                            ? Text("Forget password?",
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                    fontSize: 17))
                            : SizedBox(),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        RaisedButton(
                          elevation: 8,
                          color: showsignin ? Colors.deepOrange : Colors.cyan,
                          onPressed: () {
                            showsignin ? login() : signup();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(showsignin ? "Log In" : "Sing Up",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white)),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                    children: <TextSpan>[
                              TextSpan(
                                  text: showsignin
                                      ? "Don't have an account? "
                                      : "You are a member?"),
                              TextSpan(
                                  recognizer: changesign,
                                  text: showsignin ? "Sing Up " : "Log In",
                                  style: TextStyle(
                                      color: showsignin
                                          ? Colors.deepOrange
                                          : Colors.cyan,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      fontSize: 17))
                            ])))
                      ],
                    ),
                  )
                ]),
              ),
            )
          ],
        );
      }),
    );
  }

  //MethodList
  Positioned PositionBottom(double mdw) {
    return Positioned(
        top: 300,
        right: mdw / 1.5,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mdw),
              color: showsignin
                  ? Colors.deepPurple.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.7)),
        ));
  }

  Positioned TopPositionBottom(double mdw) {
    return Positioned(
        child: Transform.scale(
      scale: 1.3,
      child: Transform.translate(
        offset: Offset(0, -mdw / 1.7),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mdw),
              color: showsignin
                  ? Colors.deepPurpleAccent
                  : Colors.cyanAccent[700]),
        ),
      ),
    ));
  }

  AnimatedContainer CircularAvatar(double mdw) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: showsignin ? Colors.deepOrange : Colors.amber,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 15)]),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  Center FormBoxLogIn(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInBack,
        height: 235,
        width: mdw / 1.2,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.deepOrange,
            blurRadius: 2,
          )
        ]),
        child: Form(
          key: formStateLogIn,
          child: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Start text username
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                      child: Text(
                    "Email",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                  )),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  //method contien 3 argument (hint : string , password : bool , iconType : string)
                  TextFormForLogIn("Email", false, "email", email, validEmail),
                  //endUSERNAME

                  //Start passworField
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Container(
                      child: Text(
                    "User Password",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                  )),
                  Padding(padding: EdgeInsets.all(5)),
                  //method contien 3 argument (hint : string , password : bool , iconType : string)
                  TextFormForLogIn(
                      "Password", true, "pass", password, validpassword),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center FormBoxSignUp(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        height: 430,
        width: mdw / 1.2,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.cyan,
            blurRadius: 2,
          )
        ]),
        child: Form(
          key: formStateSignUp,
          child: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Start text username
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Container(
                      child: Text(
                    "Full Name",
                    style: TextStyle(color: Colors.cyan, fontSize: 16),
                  )),
                  Padding(padding: EdgeInsets.only(top: 10)),

                  //method contien 3 argument (hint : string , password : bool , iconType : string)
                  TextFormForSignUp(
                      "FullName", false, "fullname", fullname, validFullname),
                  //endUSERNAME

                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                      child: Text(
                    "Password",
                    style: TextStyle(color: Colors.cyan, fontSize: 16),
                  )),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  //method contien 3 argument (hint : string , password : bool , iconType : string)
                  TextFormForSignUp(
                      "Password", true, "pass", password, validpassword),

                  //Start passworField
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                      child: Text(
                    "Confirm Password",
                    style: TextStyle(color: Colors.cyan, fontSize: 16),
                  )),
                  Padding(padding: EdgeInsets.all(5)),
                  //method contien 3 argument (hint : string , password : bool , iconType : string)
                  TextFormForSignUp("ConfirmPassword", true, "pass",
                      confirmpassword, validconfirmpassword),

                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                      child: Text(
                    "Email",
                    style: TextStyle(color: Colors.cyan, fontSize: 16),
                  )),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  //method contien 3 argument (hint : string , password : bool , iconType : string)
                  TextFormForSignUp("Email", false, "email", email, validEmail),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField TextFormForSignUp(String hint, bool pass, String IconType,
      TextEditingController myController, valid) {
    return TextFormField(
      controller: myController,
      validator: valid,
      obscureText: pass,
      decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            IconType == "fullname"
                ? Icons.account_box_rounded
                : IconType == "pass"
                    ? Icons.lock
                    : IconType == "email"
                        ? Icons.email
                        : IconType,
            color: Colors.cyan,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.cyan)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan)) ////

          ),
      cursorColor: Colors.black,
      onFieldSubmitted: (value) {},
      keyboardType:
          pass ? TextInputType.visiblePassword : TextInputType.emailAddress,
    );
  }

  TextFormField TextFormForLogIn(String hint, bool pass, String IconType,
      TextEditingController myController, valid) {
    return TextFormField(
      controller: myController,
      validator: valid,
      obscureText: pass,
      decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            IconType == "fullname"
                ? Icons.account_box_rounded
                : IconType == "pass"
                    ? Icons.lock
                    : IconType == "email"
                        ? Icons.email
                        : IconType,
            color: Colors.deepOrange,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.deepOrange)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange)) ////

          ),
      cursorColor: Colors.black,
      onFieldSubmitted: (value) {},
      keyboardType:
          pass ? TextInputType.visiblePassword : TextInputType.emailAddress,
    );
  }
}
