import 'package:aatman/Helper/ScaleRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'LandingScreen.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  static final GlobalKey<FormState> formKey = new GlobalKey();
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();

  FocusNode emailnode = new FocusNode();
  FocusNode pwsnode = new FocusNode();

  bool onChecked = false,_obscureTextConfirm = true;

  void _toggleConfirm() {
    setState(() {
      _obscureTextConfirm = !_obscureTextConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        key: formKey,
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Log In.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "OpenSans"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 60.0),
                  child: Card(
                    margin:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(120),
                            bottomLeft: Radius.circular(120))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 120.0),
                            child: Card(
                              elevation: 15.0,
                              child: Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: "User name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Enter user name";
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(pwsnode);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 15.0,
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 30.0),
                            child: Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: TextFormField(
                                controller: pwdController,
                                focusNode: pwsnode,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          _toggleConfirm();
                                        },
                                        child: _obscureTextConfirm
                                            ? Icon(Icons.visibility_off, color: Colors.grey[200])
                                            : Icon(Icons.visibility, color: Theme.of(context).primaryColor))),
                                obscureText: _obscureTextConfirm,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Enter user name";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 30.0,top: 10.0),
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Checkbox(
                                      value: onChecked,
                                      onChanged: (bool value) {
                                        setState(() {
                                          onChecked = value;
                                        });
                                      },
                                      activeColor: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: RichText(
                                      text: TextSpan(
                                          text: "I Accept all ",
                                          style: TextStyle(
                                              color:
                                              Theme.of(context).accentColor,
                                              fontSize: 16,
                                              fontFamily: "OpenSans"),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "Terms & Conditions",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 16,
                                                  fontFamily: "OpenSans"),
                                            )
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              print("Tapped");
                              bool validate = formKey.currentState.validate();
                              if (validate) {
                                onLoginPress();
                              } else {
                                print("FIELDS are empty !!!");
                              }
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme.of(context).primaryColor),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      fontFamily: "OpenSans"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: FlatButton(
                                onPressed: (){
                                  signUpActivity();
                                },
                                child: RichText(
                                  text: TextSpan(
                                      text: "Don't have account?  ",
                                      style: TextStyle(
                                          color:
                                          Theme.of(context).accentColor,
                                          fontSize: 16,
                                          fontFamily: "OpenSans"),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Register Now",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 16,
                                              fontFamily: "OpenSans"),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onLoginPress() {
    if(onChecked){
      Navigator.pushAndRemoveUntil(
          context,
          ScaleRoute(page: LandingScreen(name: emailController.text,)),ModalRoute.withName('/LandingScreen'));
    }else{
      var snackbar = SnackBar(
          content: Text(
            "Please accept Terms & Conditions",
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 3000));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }

  }

  signUpActivity() {}
}
