/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Canopy Status
Purpose: 
- Displays relative images for canopy.
- Acquires canopy input from user.
- Redirects to pages: Size Status.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

//#2.11111: Canopy Status Page
class CanopyStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Canopy"), backgroundColor: Colors.green),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new TextCard(
                text: "How big is the canopy?",
                size: 15.0,
                box: Colors.grey[200]),
            new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Image(
                        image: new AssetImage("assets/Canopy1.png"),
                        width: 160.0,
                        height: 100.0),
                  ],
                ),
                onPressed: () {
                  globals.item.canopy="bare";
                  Navigator.of(context).pushNamed("/BotanicalStatus");
                }),
            new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Image(
                        image: new AssetImage("assets/Canopy2.png"),
                        width: 160.0,
                        height: 100.0),
                  ],
                ),
                onPressed: () {
                  globals.item.canopy="sparce";
                  Navigator.of(context).pushNamed("/BotanicalStatus");
                }),
            new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Image(
                        image: new AssetImage("assets/Canopy3.png"),
                        width: 160.0,
                        height: 100.0),
                  ],
                ),
                onPressed: () {
                  globals.item.canopy="covered";
                  Navigator.of(context).pushNamed("/BotanicalStatus");
                }),
             new RaisedButton(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Text("I'm not sure"),
                  ],
                ),
                onPressed: () {
                  globals.item.canopy = "n/a";
                  Navigator.of(context).pushNamed("/BotanicalStatus");
                },
              ),
          ],
        ));
  }
}
