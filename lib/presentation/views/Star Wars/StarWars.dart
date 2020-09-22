import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sheldon/core/models/People.dart';
import 'dart:convert';

class StarWars extends StatefulWidget {
  @override
  _StarWarsState createState() => _StarWarsState();
}

class _StarWarsState extends State<StarWars> {
  var _text;
  var _v = false;

  Future<Person> fetchAlbum() async {
    final response = await http.get('https://swapi.dev/api/people/10/');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Person.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

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
        "assets/StarWars.gif",
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
