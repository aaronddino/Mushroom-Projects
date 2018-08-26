/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Strange Info
Purpose: 
- Displays thorough information of what qualifies as a strange tree.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

class ShapeInfoPage extends StatelessWidget{
  final String strangeinfo = "Definition:\nThe tree has an outstanding, unusual abnormal or curious growth form." 
  + "\n\nThis could mean the tree either has grown at an absurd size for its species, has grown with a weird shape (twisted, deformed, not regular),"
  + "and or has grown in a very unusual location (e.g. wrapped around a pole or fence, roots over a creek etc.).";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(title: new Text("What is an Unusual Shape?"), backgroundColor: Colors.green),
      body: new Column(
        children: <Widget>[
          new Image(image: new AssetImage("assets/Shape.png"), height: 250.0, width: 300.0),
          new Container( //Information
            height: 350.0,
            child: new ListView(
              children: <Widget>[
                new Text(strangeinfo, 
                style: new TextStyle(fontSize: 15.0, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}