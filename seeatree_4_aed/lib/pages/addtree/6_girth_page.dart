/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Girth Status
Purpose: 
- Displays relative images for girth.
- Acquires girth input from user.
- Redirects to pages: Canopy Status.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

//#2.111111: Girth Status Page
class GirthStatusPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Girth"), 
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
        children: <Widget>[
          new TextCard(text:"Can you:", size: 30.0, box:Colors.grey[200]),
          new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Row(
                children: <Widget> [
                  new Image(image: new AssetImage("assets/Girth1.JPG"), width: 160.0, height: 80.0),
                  new Text("Hold?"),
                  ],),
                onPressed: () {
                  globals.item.girth = "0.5-1 metres";
                  Navigator.of(context).pushNamed("/CanopyStatus");}
              ),
          new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Row(
                children: <Widget> [
                  new Image(image: new AssetImage("assets/Girth2.JPG"), width: 160.0, height: 80.0),
                  new Text("Hug?"),
                  ],),
                onPressed: () {
                  globals.item.girth = "1-2 metres";
                  Navigator.of(context).pushNamed("/CanopyStatus");}
              ),
          new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Row(
                children: <Widget> [
                  new Image(image: new AssetImage("assets/Girth3.JPG"), width: 160.0, height: 80.0),
                  new Text("Couple hug?"),
                  ],),
                onPressed: () {
                  globals.item.girth = "2-3 metres";
                  Navigator.of(context).pushNamed("/CanopyStatus");}
              ),
          new RaisedButton(
                padding: new EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Row(
                children: <Widget> [
                  new Image(image: new AssetImage("assets/Girth4.JPG"), width: 160.0, height: 80.0),
                  new Text("Group hug?"),
                  ],),
                onPressed: () {
                  globals.item.girth = "greater than 3 metres";
                  Navigator.of(context).pushNamed("/CanopyStatus");}
              ),

          new RaisedButton(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Text("I'm not sure"),
                  ],
                ),
                onPressed: () {
                  globals.item.girth = "n/a";
                  Navigator.of(context).pushNamed("/CanopyStatus");
                },
              ),
        ],
      )
    );
  }
}