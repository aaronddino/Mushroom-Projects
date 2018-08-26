/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Landmark Info
Purpose: 
- Displays thorough information of what qualifies as a landmark tree.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

class LandmarkInfoPage extends StatelessWidget{
  final String landmarkinfo = "Definition:\nThe tree (or group of trees) has an outstanding aesthetic value, acts as a landmark or is" 
  + " a buffer to significance conservation areas or water catchments." 
  + "\n\nThis could mean that it is used as a point of direction to between people. e.g.'Let's meet up near the big oak tree in Capalaba'. \n"
  + "\nIt is aesthetically pleasing to the eye, enough to take notice or perhaps take a photo with.\n"
  + "\nThis is a tree that stands out compared to others of its kind. There may be several of its kind in close vicinity, but this one might be unique";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(title: new Text("What is a Landmark?"), backgroundColor: Colors.green),
      body: new Column(
        children: <Widget>[
          new Image(image: new AssetImage("assets/Landmark.png"), height: 250.0, width: 300.0),
          new Container( //Information
            height: 350.0,
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