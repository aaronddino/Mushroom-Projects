/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Size Status
Purpose: 
- Displays relative images for size.
- Acquires size input from user.
- Redirects to pages: Girth Status.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/UI/picture_button.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

//#2.1111: Size Status Page
class SizeStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            new TextCard(
                text: globals.item.girth, size: 15.0, box: Colors.grey[200]),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new RaisedButton(
                    padding: new EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new Image(
                            image: new AssetImage("assets/Size1.png"),
                            width: 160.0,
                            height: 150.0),
                      ],
                    ),
                    onPressed: () {
                      globals.item.height = "5-10 metres";
                      Navigator.of(context).pushNamed("/GirthStatus");
                    }),
                new RaisedButton(
                    padding: new EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new Image(
                            image: new AssetImage("assets/Size2.png"),
                            width: 160.0,
                            height: 150.0),
                      ],
                    ),
                    onPressed: () {
                      globals.item.height = "10-20 metres";
                      Navigator.of(context).pushNamed("/GirthStatus");
                    }),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new RaisedButton(
                    padding: new EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new Image(
                            image: new AssetImage("assets/Size3.png"),
                            width: 160.0,
                            height: 150.0),
                      ],
                    ),
                    onPressed: () {
                      globals.item.height = "20-30 metres";
                      Navigator.of(context).pushNamed("/GirthStatus");
                    }),
                new RaisedButton(
                    padding: new EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new Image(
                            image: new AssetImage("assets/Size4.png"),
                            width: 160.0,
                            height: 150.0),
                      ],
                    ),
                    onPressed: () {
                      globals.item.height = "greater than 30 metres";
                      Navigator.of(context).pushNamed("/GirthStatus");
                    }),
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
                  globals.item.height = "n/a";
                  Navigator.of(context).pushNamed("/GirthStatus");
                },
              ),
          ],
        ));
  }
}
