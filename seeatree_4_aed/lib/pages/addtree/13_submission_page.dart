/*
-See A Tree Citizen Science Project App
- Aarond Dino

Page: Submission
Purpose: 
- Displays all user inputs from previous pages.
- Submit button sends data to database.
- Redirects to pages: Submitted.
*/

import 'package:flutter/material.dart';
import 'package:seeatree_4_aed/widgets.dart';
import 'package:seeatree_4_aed/objects/item.dart' as globals;
import 'package:seeatree_4_aed/objects/itemconstructor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class SubmissionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SubmissionState();
  }
}

class SubmissionState extends State<SubmissionPage> {
  Item send = globals.item;
  DatabaseReference itemref;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemref = database.reference().child('items');
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.day.toString()}-${today.month.toString().padLeft(2,'0')}-${today.year.toString().padLeft(2,'0')}";
    return new Scaffold(
      appBar:
          new AppBar(title: new Text("Review"), backgroundColor: Colors.green),
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    color: Colors.white,
                    width: 150.0,
                    height: 200.0,
                    child: Image.network(globals.item.image1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    color: Colors.white,
                    width: 150.0,
                    height: 200.0,
                    child: Image.network(globals.item.image2),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            height: 300.0,
            child: new ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                  child: new Column(
                    children: <Widget>[
                      new Text("Species: " + globals.item.species,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Date: " + dateSlug,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Latitude: " + globals.item.latitude,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Longitude: " + globals.item.longitude,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Canopy Cover: " + globals.item.canopy,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Girth: " + globals.item.girth,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Height: " + globals.item.height,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Health: " + globals.item.health,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Botanical: " + globals.item.botanical,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Habitat: " + globals.item.habitat,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Historical: " + globals.item.historical,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Historical: " + globals.item.historical,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Landmark: " + globals.item.landmark,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                      new Text("Shape: " + globals.item.shape,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.black)),
                    ],
                  ),
                );
              },
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.brown,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed("/Submitted");
                globals.item.date = dateSlug;
                globals.item.useremail = globals.useremail;
                itemref.push().set(send.toJson());
              },
              color: Colors.green.shade600,
              child: Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
