/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Rules
Purpose: 
- Outlines guidelines for a Veteran or Significant Tree submission.
- Redirects to: several indepth pages on specific traits, Health Status.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

//#2.1 Rules Page
class RulesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Rules"), backgroundColor: Colors.green),
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Text("Remember, before submitting the tree must be:", style: new TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
              new TextCard(text:"Veteran", size: 12.0, box:Colors.grey[200]),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new PictureButton(
                    image: "assets/tree2.png",
                    text: "Wide Trunk",
                    nextpage: "/MyTrees",
                    width: 150.0,
                    height: 50.0,
                  ),
                  new PictureButton(
                    image: "assets/tree2.png",
                    text: "Hollow Trunk",
                    nextpage: "/MyTrees",
                    width: 150.0,
                    height: 50.0,
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new PictureButton(
                    image: "assets/tree2.png",
                    text: "Lack of Leaves",
                    nextpage: "/MyTrees",
                    width: 330.0,
                    height: 50.0,
                  ),
                ],
              ),
              new Text("OR", style: new TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
              new TextCard(text:"Significant", size: 12.0, box:Colors.grey[200]),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new PictureButton(
                    image: "assets/Landmark.png",
                    text: "Landmark",
                    nextpage: "/LandmarkInfo",
                    width: 150.0,
                    height: 50.0,
                  ),
                  new PictureButton(
                    image: "assets/Shape.png",
                    text: "Strange",
                    nextpage: "/ShapeInfo",
                    width: 150.0,
                    height: 50.0,
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new PictureButton(
                    image: "assets/Botanical.png",
                    text: "Rare",
                    nextpage: "/RareInfo",
                    width: 150.0,
                    height: 50.0,
                  ),
                  new PictureButton(
                    image: "assets/Historical.png",
                    text: "Historic",
                    nextpage: "/MyTrees",
                    width: 150.0,
                    height: 50.0,
                  ),
                ],
              ),
              //needs hyperlink aka inkwell()
              new Text("Click here to find out more", style: new TextStyle(fontSize: 8.0), textAlign: TextAlign.center,),
              new RaisedButton(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Text("Next"),
                  ],
                ),
                onPressed: () {Navigator.of(context).pushNamed("/HealthConditions");},
              ),
              new Text("Mushroom Projects 2018 ©", style: new TextStyle(fontSize: 8.0), textAlign: TextAlign.center,),
            ]
          )
        )
    );
  }
}