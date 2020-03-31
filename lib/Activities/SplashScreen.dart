import 'package:aatman/Helper/ScaleRoute.dart';
import 'package:flutter/material.dart';

import 'LogInScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset("assets/images/aatman_logo.png",height: 80.0,width: 230.0,)
            ),
            Positioned(
                bottom: 15.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child:Text(
                    "Aurus Inc.",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ) ,
                )
            ),
          ],
        ),
      ),
    );
  }

  navigate() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context, ScaleRoute(page:LogInScreen()), ModalRoute.withName('/LogInScreen'));
    });
  }
}
