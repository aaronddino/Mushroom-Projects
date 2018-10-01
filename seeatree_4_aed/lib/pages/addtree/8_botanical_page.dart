/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Botanical Status
Purpose: 
- Displays aspects for a botanical status.
- Acquires yes/no input from user.
- Redirects to pages: Botanical Info, Historical Status.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;

//#2.1111111: Botanical Status Page
class BotanicalStatusPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Botanical"), 
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
          new TextCard(text:"Is this tree rare in the wild?", size: 15.0, box:Colors.grey[200]),
          PictureButtonNoText(
            image: "assets/Botanical.png",
            nextpage: "/BotanicalStatus",
            width: 160.0,
            height: 200.0,
          ),
          new Column(
            children: <Widget>[
              //new Text("Provides a home for animals such as birds"),
              new TextCard(text:"Rarely found within the wild", size: 15.0, box:Colors.grey[200]),
              new Text("OR"),
              //new Text("Provides living conditions for other plants"),
              new TextCard(text:"Traditionally grown within special areas", size: 15.0, box:Colors.grey[200]),
              
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
                      globals.item.botanical  = "Yes";
                      Navigator.of(context).pushNamed("/HistoricalStatus");
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
                      globals.item.botanical  = "n/a";
                      Navigator.of(context).pushNamed("/HistoricalStatus");
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
                      globals.item.botanical  = "No";
                      Navigator.of(context).pushNamed("/HistoricalStatus");
                    },
                  ),
                ],
              ),
            ),
      ],)
    );
  }
}