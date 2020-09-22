import 'package:flutter/material.dart';
import 'presentation/views/home/Home.dart';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: new MyApp(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // we will use named routes
      routes: {
        //'/': (context) => Home(),
      },
      //initialRoute: '/',
    ),
  );
}

// This page is the first one in the app it will show a GIF and after 4 seconds redirect to home page
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/sheldon.gif",
              gaplessPlayback: true,
            )));
  }
}
