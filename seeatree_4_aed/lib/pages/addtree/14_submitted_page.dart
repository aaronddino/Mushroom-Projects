/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Submitted
Purpose: 
- Displays verification that data has been sent.
- Redirects to pages: Home.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;
import 'package:seeatree_4_aed/objects/itemconstructor.dart'; 

class SubmittedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SubmittedPageState();
  }
}

class SubmittedPageState extends State<SubmittedPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
            title: new Text("Success!"), 
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
          new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: new Icon(Icons.check_circle,
                    size: 350.0, color: Colors.green[800]),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.brown,
                      elevation: 5.0,
                      child: MaterialButton(
                        minWidth: 150.0,
                        height: 42.0,
                        onPressed: () {
                          Navigator.of(context).pushNamed("/AddTree");
                        },
                        color: Colors.grey,
                        child:
                            Text('Add Another!', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.brown,
                      elevation: 5.0,
                      child: MaterialButton(
                        minWidth: 150.0,
                        height: 42.0,
                        onPressed: () {
                          globals.item = new Item("","","","","","","","","","","","","","","","","");
                          Navigator.of(context).pushNamed("/HomePage");
                        },
                        color: Colors.green.shade600,
                        child: Text('Homepage',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
