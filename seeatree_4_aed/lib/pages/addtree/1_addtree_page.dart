/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Add Tree
Purpose: 
- Displays instructions for optimal tree photo submission.
- Opens camera feature to take a photo of a tree.
- Redirects to pages: Rules.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';

//#2 Add Tree Page
class AddTreePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Add Tree"), backgroundColor: Colors.green),
      body: new Container(
        child: new Center(
          child: new Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Text("Upload at Least One Image That:", style: new TextStyle(fontSize: 20.0), textAlign: TextAlign.center,),
              new Text("Contains the full size of the tree", style: new TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
              new Text("OPTIONAL: Extra images of close-ups, leaves, roots, or special features", style: new TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
              new Image(image: new AssetImage("assets/AddTreeSpecs.png"), width: 300.0, height: 150.0),
              new TextCard(text:"Would you like to add an image?", size: 12.0, box:Colors.grey[200]),
              new Column(
                children: <Widget>[
                  new IconButton(
                    color: Colors.grey[200],
                    icon: new Icon(Icons.camera_alt, color: Colors.black),
                    iconSize: 50.0, 
                    onPressed: null
                  ),
                  new Text("Take Photo!", style: new TextStyle(fontSize: 15.0), textAlign: TextAlign.center,),
                ],
              ),
              new TextCard(text:"Are you happy with these images?", size: 12.0, box:Colors.grey[200]),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Image(image: new AssetImage("assets/photo1.jpg"), width: 100.0, height: 100.0),
                  new Image(image: new AssetImage("assets/photo2.jpg"), width: 100.0, height: 100.0),
                ],
              ),
              new RaisedButton(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Text("Submit"),
                  ],
                ),
                onPressed: () {Navigator.of(context).pushNamed("/Rules");},
              )
            ]
          )
        )
      ),
    );
  }
}