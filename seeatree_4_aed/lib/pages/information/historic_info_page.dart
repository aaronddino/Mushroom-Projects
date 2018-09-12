/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Historic Info
Purpose: 
- Displays thorough information of what qualifies as a landmark tree.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

class HistoricInfoPage extends StatelessWidget{
  final String landmarkinfo = "Definition:\nThe tree has a historic association, by events in the past and or used in commemorative events or celebrations. " 
  + "\n\nThis could mean the tree has indigenous value, is a historic site, or takes part in commemorating events. It is a tree that cannot be cut down due to its affiliations.  \n";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(title: new Text("What is a Historic Tree?"), backgroundColor: Colors.green),
      body: new Column(
        children: <Widget>[
          new Image(image: new AssetImage("assets/Historical.png"), height: 250.0, width: 300.0),
          new Flexible( //Information
            
            child: new ListView(
              children: <Widget>[
                new Text(landmarkinfo, 
                style: new TextStyle(fontSize: 15.0, color: Colors.black)),
              ],
            ),
          ),

        ],
      ),
    );
  }
}