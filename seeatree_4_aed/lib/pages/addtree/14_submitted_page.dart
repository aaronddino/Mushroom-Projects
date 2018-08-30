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
          title: new Text("Success!"), backgroundColor: Colors.green),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.brown,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 42.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/HomePage");
                    },
                    color: Colors.green.shade600,
                    child:
                        Text('Homepage', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
