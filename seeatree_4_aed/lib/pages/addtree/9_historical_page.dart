/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Historical Status
Purpose: 
- Displays aspects for a historical status.
- Acquires yes/no input from user.
- Redirects to pages: Historical Info, Shape Status.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

//#2.11111111: Historical Status Page
class HistoricalStatusPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Historical"), 
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
          new TextCard(text:"Does this tree have history?", size: 15.0, box:Colors.grey[200]),
          PictureButtonNoText(
            image: "assets/Historical.png",
            nextpage: "/HistoricalStatus",
            width: 160.0,
            height: 200.0,
          ),
          new Column(
            children: <Widget>[
              //new Text("Provides a home for animals such as birds"),
              new TextCard(text:"Have a specific historical background", size: 15.0, box:Colors.grey[200]),
              new Text("OR"),
              //new Text("Provides living conditions for other plants"),
              new TextCard(text:"Used within commemorative associations", size: 15.0, box:Colors.grey[200]),
              
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
              child: new Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new RaisedButton(
                    color: Colors.lightGreenAccent,
                    child: new Column(
                      children: <Widget>[
                        new Text("Yes"),
                      ],
                    ),
                    onPressed: () {
                      globals.item.historical  = "Yes";
                      Navigator.of(context).pushNamed("/ShapeStatus");
                    },
                  ),
                  Container(
                    width: 150.0,
                  child: new RaisedButton(
                    color: Colors.orange,
                    child: new Column(
                      children: <Widget>[
                        new Text("I'm not sure"),
                      ],
                    ),
                    onPressed: () {
                      globals.item.historical  = "n/a";
                      Navigator.of(context).pushNamed("/ShapeStatus");
                    },
                  ),),
                  new RaisedButton(
                    color: Colors.redAccent,
                    child: new Column(
                      children: <Widget>[
                        new Text("No"),
                      ],
                    ),
                    onPressed: () {
                      globals.item.historical  = "No";
                      Navigator.of(context).pushNamed("/ShapeStatus");
                    },
                  ),
                ],
              ),
            ),
      ],)
    );
  }
}