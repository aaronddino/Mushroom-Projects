/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Habitat Status
Purpose: 
- Displays aspects for a habitat status.
- Acquires yes/no input from user.
- Redirects to pages: Habitat Info, Species Match.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

//#2.1111111111: Habitat Status Page
class HabitatStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Habitat"), backgroundColor: Colors.green),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new TextCard(
                text: "Does this tree house animals and plants?",
                size: 15.0,
                box: Colors.grey[200]),
            PictureButtonNoText(
              image: "assets/Habitat.png",
              nextpage: "/HabitatStatus",
              width: 160.0,
              height: 200.0,
            ),
            new Column(
              children: <Widget>[
                //new Text("Provides a home for animals such as birds"),
                new TextCard(
                    text: "Provides a home for animals such as birds",
                    size: 15.0,
                    box: Colors.grey[200]),
                new Text("OR"),
                //new Text("Provides living conditions for other plants"),
                new TextCard(
                    text: "Provides living conditions for other plants",
                    size: 15.0,
                    box: Colors.grey[200]),
              ],
            ),
            new Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new RaisedButton(
                  color: Colors.lightGreenAccent,
                  child: new Column(
                    children: <Widget>[
                      new Text("Yes"),
                    ],
                  ),
                  onPressed: () {
                    globals.item.habitat = "Yes";
                    Navigator.of(context).pushNamed("/Species");
                  },
                ),
                new RaisedButton(
                  color: Colors.redAccent,
                  child: new Column(
                    children: <Widget>[
                      new Text("No"),
                    ],
                  ),
                  onPressed: () {
                    globals.item.habitat = "No";
                    Navigator.of(context).pushNamed("/Species");
                  },
                ),
              ],
            ),
            new RaisedButton(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Text("I'm not sure"),
                  ],
                ),
                onPressed: () {
                  globals.item.habitat = "n/a";
                  Navigator.of(context).pushNamed("/Species");
                },
              ),
          ],
        ));
  }
}
