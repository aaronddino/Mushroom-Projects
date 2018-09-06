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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: 150.0,
                height: 200.0,
                child: Image.network(globals.item.image1),
              ),
              Container(
                color: Colors.white,
                width: 150.0,
                height: 200.0,
                child: Image.network(globals.item.image2),
              ),
            ],
          ),
          new Container(
            height: 250.0,
            child: new ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
               
                return new Container(
                  child: new Column(
                    children: <Widget>[
                      new TextCard(
                          text: "Species: " + globals.item.species,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Canopy Cover: " + globals.item.canopy,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Girth: " + globals.item.girth,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Height: " + globals.item.height,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Health: " + globals.item.health,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Botanical: " + globals.item.botanical,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Habitat: " + globals.item.habitat,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Historical: " + globals.item.historical,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Landmark: " + globals.item.landmark,
                          size: 15.0,
                          box: Colors.grey[200]),
                      new TextCard(
                          text: "Shape: " + globals.item.shape,
                          size: 15.0,
                          box: Colors.grey[200]),
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
                              Navigator.of(context).pushNamed("/Submitted");
                              globals.item.date = dateSlug;
                              itemref.push().set(send.toJson());
                            },
                            color: Colors.green.shade600,
                            child: Text('Submit',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
