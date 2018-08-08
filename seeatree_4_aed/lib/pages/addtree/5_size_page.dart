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
        appBar:
            new AppBar(title: new Text("Size"), backgroundColor: Colors.green),
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
                      globals.item.height = "Tiny";
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
                      globals.item.height = "Medium";
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
                      globals.item.height = "Large";
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
                      globals.item.height = "Jumbo";
                      Navigator.of(context).pushNamed("/GirthStatus");
                    }),
              ],
            ),
            new TextButton(
              text: "I'm not sure",
              color: Colors.white,
              nextpage: "/GirthStatus",
            ),
          ],
        ));
  }
}
