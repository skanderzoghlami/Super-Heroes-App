import 'package:flutter/material.dart';
import 'package:sheldon/presentation/views/Star%20Wars/StarWars.dart';
import 'package:sheldon/presentation/views/StarTrek/StartTrek.dart';
import 'package:sheldon/presentation/views/Super%20Heroes/SuperHeroes.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // A listView allows you to add an infinite number of widgets
        body: new ListView(padding: const EdgeInsets.all(50.0), children: [
      //this empy container is a padding
      new Container(
        height: 50.0,
      ),
      new Container(
          child: Text(
        'Hello There what do you wanna Learn today ?',
        style: TextStyle(height: 1, fontSize: 20),
      )),
      //this empy container is a padding
      new Container(
        height: 50.0,
      ),
      Image.asset(
        "assets/sheldonAsk.gif",
        gaplessPlayback: true,
      ),
      new Container(
        height: 50.0,
      ),
      new Center(
        child: SizedBox(
          // using a buttontheme allows you to specify button size
          width: double.infinity,
          child: new RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.lightGreen,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StarWars()),
            ),
            child: new Text("Star wars",
                style: TextStyle(height: 1, fontSize: 20)),
          ),
        ),
      ),
      new Center(
        child: SizedBox(
          // using a buttontheme allows you to specify button size
          width: double.infinity,
          child: new RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.lightGreen,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StarTrek()),
            ),
            child: new Text("Star trek",
                style: TextStyle(height: 1, fontSize: 20)),
          ),
        ),
      ),
      new Center(
        child: SizedBox(
          // using a buttontheme allows you to specify button size
          width: double.infinity,
          child: new RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.lightGreen,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuperHeroes()),
            ),
            child: new Text("Super heroes",
                style: TextStyle(height: 1, fontSize: 20)),
          ),
        ),
      ),
    ]));
  }
}
