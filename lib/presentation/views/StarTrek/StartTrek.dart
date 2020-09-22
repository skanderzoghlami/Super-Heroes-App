import 'package:flutter/material.dart';

class StarTrek extends StatefulWidget {
  @override
  _StartWarsState createState() => _StartWarsState();
}

class _StartWarsState extends State<StarTrek> {
  var _text;
  var _v = false;
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
        'Enter the query you want to ask me about',
        style: TextStyle(height: 1, fontSize: 20),
      )),
      //this empy container is a padding
      new Container(
        height: 50.0,
      ),
      Image.asset(
        "assets/StarTrek.gif",
        gaplessPlayback: true,
      ),
      new Container(
        height: 50.0,
      ),
      TextField(
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Enter a search term'),
        onChanged: (text) {
          setState(() {
            _text = text;
          });
          print("First text field: $text");
        },
      ),
      new Center(
        child: SizedBox(
          // using a buttontheme allows you to specify button size
          width: double.infinity,
          child: new RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.lightGreen,
            onPressed: () {
              print(_text);
              setState(() {
                _v = true;
              });
            },
            child:
                new Text("Search", style: TextStyle(height: 1, fontSize: 20)),
          ),
        ),
      ),
      _v == true
          ? Container(
              child: Text("Return Value"),
            )
          : Container()
    ]));
  }
}
