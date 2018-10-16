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
class PermissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Permission"), 
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
                  Navigator.of(context).pushNamed("/");
                },
              ),
            ],
            backgroundColor: Colors.green,
            ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new TextCard(
                text:
                    "Is tree owner aware of this survey record being submitted?",
                size: 30.0,
                box: Colors.grey[200]),
            PictureButtonNoText(
              image: "assets/home_tree.png",
              nextpage: "/BotanicalStatus",
              width: 250.0,
              height: 250.0,
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
                      globals.item.owneraware = "Yes";
                      Navigator.of(context).pushNamed("/HealthConditions");
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
                      globals.item.owneraware = "n/a";
                      Navigator.of(context).pushNamed("/HealthConditions");
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
                      globals.item.owneraware = "No";
                      Navigator.of(context).pushNamed("/HealthConditions");
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
