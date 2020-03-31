import 'package:aatman/Helper/FadeAnimation.dart';
import 'package:aatman/Helper/ScaleRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ActivityDetailsScreen.dart';
import 'LogInScreen.dart';
class LandingScreen extends StatefulWidget {

  final String name;

  const LandingScreen({this.name});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Do you really want to exit the app?"),
          actions: <Widget>[
            FlatButton(
              child: Text("No"),
              onPressed: ()=>Navigator.pop(context,false),
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: ()=>Navigator.pop(context,true),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Hey "+widget.name+"!",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: "OpenSans"
            ),
          ),
        ),
        drawer:Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 276.0,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage("assets/images/profile_avatar.png")
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "Manish Malhotra",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "OpenSans",
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Emp Id: 20205",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "OpenSans",
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).accentColor),
                      ),
                      FlatButton(
                        onPressed: (){},
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OpenSans",
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "My Activities",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSans",
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "My Rewards",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSans",
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {},
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:  ListTile(
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans",
                          fontStyle: FontStyle.normal,
                          color: Theme.of(context).accentColor),
                    ),
                    onTap: () {
                      logOut();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20.0,top: 25.0),
                child: FadeAnimation(
                  1.4,
                  Text(
                    "Activities Recommended For You",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSans",
                        fontStyle: FontStyle.normal,
                        color: Theme.of(context).accentColor),
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return FadeAnimation(
                          1.4,
                          Container(
                            height: 170.0,
                            width: 566.0,
                            child: Card(
                              margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),
                              elevation: 15.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(72.0)
                              ),
                              color: Theme.of(context).primaryColor,
                              child: InkWell(
                                onTap: (){
                                  detailsPage();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 68.0),
                                  padding: EdgeInsets.only(left: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(72.0), bottomRight: Radius.circular(72.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 25.0,),
                                      Text(
                                        "10KM Marathon",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "OpenSans",
                                            fontStyle: FontStyle.normal,
                                            color: Theme.of(context).accentColor),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text(
                                        "Nigdi Chowk <--> Kasarwadi",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "OpenSans",
                                            fontStyle: FontStyle.normal,
                                            color: Theme.of(context).accentColor),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 10.0),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Icon(Icons.calendar_today,size: 18.0,),
                                                    SizedBox(width: 5.0,),
                                                    Text(
                                                      "22-03-2020",
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "OpenSans",
                                                          fontStyle: FontStyle.normal,
                                                          color: Theme.of(context).accentColor),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 25.0,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Icon(Icons.watch_later,size: 18.0,),
                                                    SizedBox(width: 5.0,),
                                                    Text(
                                                      "05:40 AM",
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "OpenSans",
                                                          fontStyle: FontStyle.normal,
                                                          color: Theme.of(context).accentColor),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  logOut() {
    Navigator.pushAndRemoveUntil(
        context,
        ScaleRoute(page: LogInScreen()),ModalRoute.withName('/LogInScreen'));
  }

  detailsPage() {
    Navigator.push(
        context,
        ScaleRoute(page:ActivityDetailsScreen()));
  }
}
