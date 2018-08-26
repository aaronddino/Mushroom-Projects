/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Rare Info
Purpose: 
- Displays thorough information of what qualifies as a rare botanical tree.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

class RareInfoPage extends StatelessWidget{
  final String strangeinfo = "Definition:\nThe tree is rarely found in the wild or in cultivation. In other words, a botanical tree." 
  + "\n\nTo further explain, this is a tree that would normally be found grown in a personal care for its living conditions. This tree "
  + "is not native to the environment, and its seeds would have been planted there by someone. The tree would definitely stand out compared to "
  + "others in the area. A wild example would be like finding a cherry blossom near the beach.";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(title: new Text("What is a Rare Tree?"), backgroundColor: Colors.green),
      body: new Column(
        children: <Widget>[
          new Image(image: new AssetImage("assets/Botanical.png"), height: 250.0, width: 300.0),
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