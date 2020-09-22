import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sheldon/core/models/SuperHeroes.dart';

class SuperHeroes extends StatefulWidget {
  @override
  _SuperHeroesState createState() => _SuperHeroesState();
}

class _SuperHeroesState extends State<SuperHeroes> {
  var _text;
  var _v = false;
  Future<SuperHero> superHero;
  Future<SuperHero> fetchAlbum(String text) async {
    final response = await http.get(
        'https://www.superheroapi.com/api.php/3298464243711106/search/' + text);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SuperHero.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  //void initState() {
  // super.initState();
  //  superHero = fetchAlbum();
  //}

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
        "assets/SheldonSH.gif",
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
                superHero = fetchAlbum(_text);
              });
            },
            child:
                new Text("Search", style: TextStyle(height: 1, fontSize: 20)),
          ),
        ),
      ),
      _v == true
          ? Container(
              child: FutureBuilder<SuperHero>(
              future: superHero,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 20,
                      ),
                      Text(
                          snapshot.data.fullname +
                              " AKA " +
                              snapshot.data.fullname +
                              " is a " +
                              snapshot.data.occupation +
                              " at " +
                              snapshot.data.base +
                              " he is part of  : " +
                              snapshot.data.group +
                              " and here's my best poster of him ",
                          style: TextStyle(height: 1, fontSize: 19)),
                      Image.network(snapshot.data.image)
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ))
          : Container()
    ]));
  }
}
