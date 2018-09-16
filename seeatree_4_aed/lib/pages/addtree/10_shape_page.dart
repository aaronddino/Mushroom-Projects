/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Shape Status
Purpose: 
- Displays aspects for shape status.
- Acquires yes/no input from user.
- Redirects to pages: Shape Info, Habitat Status.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

//#2.111111111: Shape Status Page
class ShapeStatusPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Permission"), 
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: (){
                  Navigator.of(context).pushNamed("/poprules");
                },
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: (){
                  Navigator.of(context).pushNamed("/HomePage");
                },
              ),
            ],
            backgroundColor: Colors.green,
            ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new TextCard(text:"Does this tree present unusual growth or form?", size: 15.0, box:Colors.grey[200]),
          PictureButtonNoText(
            image: "assets/Shape.png",
            nextpage: "/HistoricalStatus",
            width: 160.0,
            height: 200.0,
          ),
          new Column(
            children: <Widget>[
              //new Text("Provides a home for animals such as birds"),
              new TextCard(text:"Outstanding growth for its species", size: 15.0, box:Colors.grey[200]),
              new Text("OR"),
              new TextCard(text:"Has grown a weird shape", size: 15.0, box:Colors.grey[200]),
              new Text("OR"),
              new TextCard(text:"Presents an unusual area for growth", size: 15.0, box:Colors.grey[200]),
              
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
                    globals.item.shape = "Yes";
                    Navigator.of(context).pushNamed("/HabitatStatus");
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
                    globals.item.shape = "No";
                    Navigator.of(context).pushNamed("/HabitatStatus");
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
                  globals.item.shape = "n/a";
                  Navigator.of(context).pushNamed("/HabitatStatus");
                },
              ),
      ],)
    );
  }
}