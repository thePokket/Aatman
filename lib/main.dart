import 'package:flutter/material.dart';

import 'Activities/SplashScreen.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff4B63FF),
        primaryColorDark: Color(0xff1830CC),
        accentColor: Colors.grey[600],
      ),
      title: "Aatman",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
